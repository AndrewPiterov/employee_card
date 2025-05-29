import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'repositories/repositories.dart';

final getIt = GetIt.instance;

Future<void> initApp() async {
  //
  final dio = Dio();
  dio.options.baseUrl = 'https://randomuser.me/api/';
  final userRepository = WorkerRepository(dio);

  // Register repositories
  getIt.registerSingleton<IWorkerRepository>(userRepository);
}
