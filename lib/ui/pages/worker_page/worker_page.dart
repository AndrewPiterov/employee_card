import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'widgets/widgets.dart';

export './bloc/bloc.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({super.key});

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточка работника')),
      body: BlocBuilder<WorkerBloc, WorkerState>(
        builder: (context, state) {
          if (state is WorkerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorkerLoaded) {
            final worker = state.user;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [WorkerView(worker)]),
            );
          } else {
            return const Center(child: Text('Ошибка загрузки данных'));
          }
        },
      ),
    );
  }
}
