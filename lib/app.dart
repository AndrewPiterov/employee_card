import 'package:employee_card/app/app.dart';
import 'package:employee_card/app/repositories/worker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worker Card',
      theme: AppTheme.defaultTheme,

      home: BlocProvider(
        create: (_) =>
            WorkerBloc(getIt<IWorkerRepository>())..add(FetchWorkerEvent()),
        child: const WorkerPage(),
      ),
    );
  }
}
