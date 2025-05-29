import 'package:employee_card/app/models/worker_model.dart';

abstract class WorkerState {}

class WorkerInitial extends WorkerState {}

class WorkerLoading extends WorkerState {}

class WorkerLoaded extends WorkerState {
  WorkerLoaded(this.user);

  final UserModel user;
}
