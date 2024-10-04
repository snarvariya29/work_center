import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/core/navigation/app_router.dart';
import 'package:get_work/src/core/services/job_service.dart';
import 'package:get_work/src/screens/common/auth/bloc/auth_bloc.dart';
import 'package:get_work/src/screens/common/auth/service/auth_service.dart';
import 'package:get_work/src/screens/management/create_job/bloc/create_job.dart';
import 'package:get_work/src/screens/management/home_screen/blocs/get_jobs_qubit.dart';
import 'package:get_work/src/shared/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final JobService jobService = JobService();
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthService>(create: (context) => authService),
        RepositoryProvider<JobService>(create: (context) => jobService),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authService)),
        BlocProvider<CreateJobCubit>(
            create: (context) => CreateJobCubit(jobService)),
        BlocProvider<GetJobsQubit>(
            create: (context) => GetJobsQubit(jobService))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
