import 'package:employee_card/app/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'states.dart';

export './events.dart';
export './states.dart';

class WorkerError extends WorkerState {}

// Bloc
class WorkerBloc extends Bloc<WorkerEvent, WorkerState> {
  final IWorkerRepository userRepository;

  WorkerBloc(this.userRepository) : super(WorkerInitial()) {
    on<FetchWorkerEvent>((event, emit) async {
      emit(WorkerLoading());

      final userResult = await userRepository.getWorker();

      if (userResult.isFail) {
        emit(WorkerError());
        return;
      }

      emit(WorkerLoaded(userResult.value!));
    });
  }
}
