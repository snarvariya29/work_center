import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/core/models/job.dart';
import 'package:get_work/src/core/services/job_service.dart';

enum CreateJobStatus { success, failed, initial, loading }

class CreateJobState {
  final CreateJobStatus? status;
  final String? error;
  CreateJobState({this.status, this.error});

  CreateJobState copyWith({CreateJobStatus? status, String? error}) {
    return CreateJobState(
        status: status ?? this.status, error: error ?? this.error);
  }
}

class CreateJobCubit extends Cubit<CreateJobState> {
  final JobService _jobService;
  CreateJobCubit(JobService jobService)
      : _jobService = jobService,
        super(CreateJobState(status: CreateJobStatus.initial));

  Future<void> createJob(Job job) async {
    emit(state.copyWith(status: CreateJobStatus.loading));
    try {
      _jobService.createJob(job);
      emit(state.copyWith(status: CreateJobStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreateJobStatus.failed, error: e.toString()));
    }
  }
}
