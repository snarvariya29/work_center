import 'package:get_work/src/core/navigation/app_routes.dart';
import 'package:get_work/src/screens/common/auth/login_controller.dart';
import 'package:get_work/src/screens/common/auth/signup_screen.dart';
import 'package:get_work/src/screens/common/job_details/job_details.dart';
import 'package:get_work/src/screens/management/create_job/create_job.dart';
import 'package:get_work/src/screens/management/home_screen/navbar_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
          name: AppRoutes.login.name,
          path: '/',
          builder: (context, state) => const LoginController(),
          routes: [
            GoRoute(
              name: AppRoutes.signup.name,
              path: 'signup',
              builder: (context, state) => const RegisterScreen(),
            ),
          ]),
      GoRoute(
          path: '/home',
          name: AppRoutes.home.name,
          builder: (context, state) => const NavBarScreen(),
          routes: [
            GoRoute(
                path: 'create-job',
                name: AppRoutes.createJob.name,
                builder: (context, state) => const CreateJobScreen()),
            GoRoute(
                path: 'view-job',
                name: 'view-job',
                builder: (context, state) {
                  final data = state.extra as Map;
                  return JobDetailsScreen(
                    job: data['job'],
                  );
                })
          ]),
    ],
  );
}
