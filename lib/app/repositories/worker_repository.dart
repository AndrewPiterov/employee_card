import 'package:dio/dio.dart';
import 'package:employee_card/app/models/models.dart';
import 'package:fluent_result/fluent_result.dart';

abstract interface class IWorkerRepository {
  Future<ResultOf<UserModel?>> getWorker();
}

class WorkerRepository implements IWorkerRepository {
  WorkerRepository(this.dio);

  final Dio dio;

  @override
  Future<ResultOf<UserModel?>> getWorker() async {
    final response = await dio.get('/');
    if (response.statusCode == 200) {
      final data = response.data;
      final worker = data['results']?[0];
      return successWith(UserModel.fromJson(worker));
    }

    return fail('Failed to load worker data');
  }
}
