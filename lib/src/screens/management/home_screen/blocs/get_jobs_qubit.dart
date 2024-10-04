import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/core/models/job.dart';
import 'package:get_work/src/core/services/job_service.dart';

enum GetJobsStatus { success, failed, initial, loading }

class GetJobsState {
  final GetJobsStatus? status;
  final String? error;
  final List<Job>? jobs;
  GetJobsState({this.jobs, this.status, this.error});

  GetJobsState copyWith(
      {GetJobsStatus? status, String? error, List<Job>? jobs}) {
    return GetJobsState(
        status: status ?? this.status,
        error: error ?? this.error,
        jobs: jobs ?? this.jobs);
  }
}

class GetJobsQubit extends Cubit<GetJobsState> {
  final JobService _jobService;
  GetJobsQubit(JobService jobService)
      : _jobService = jobService,
        super(GetJobsState(status: GetJobsStatus.initial));

  Future<void> getJobs() async {
    emit(state.copyWith(status: GetJobsStatus.loading));
    try {
      final jobs = await _jobService.getJobs();
      emit(state.copyWith(status: GetJobsStatus.success, jobs: jobs));
    } catch (e) {
      emit(state.copyWith(status: GetJobsStatus.failed, error: e.toString()));
    }
  }
}
