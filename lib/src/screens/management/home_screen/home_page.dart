import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/screens/management/home_screen/blocs/get_jobs_qubit.dart';
import 'package:get_work/src/screens/management/home_screen/widgets/job_view_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJobsQubit, GetJobsState>(
      builder: (context, state) {
        if (state.status == GetJobsStatus.success) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.jobs!.length,
            itemBuilder: (BuildContext context, int index) {
              return JobViewCard(job: state.jobs![index]);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
