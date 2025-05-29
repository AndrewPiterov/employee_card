import 'package:employee_card/app/models/models.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class WorkerView extends StatefulWidget {
  const WorkerView(this.worker, {super.key});

  final UserModel worker;

  @override
  State<WorkerView> createState() => _WorkerViewState();
}

class _WorkerViewState extends State<WorkerView> {
  UserModel get _worker => widget.worker;

  bool _isExpanded = false;

  void _callWorker() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 8),
            Text('Звонок работнику...'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() => _isExpanded = isExpanded);
      },
      children: [
        ExpansionPanel(
          isExpanded: _isExpanded,
          headerBuilder: (_, isExpanded) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_worker.avatarUrl),
            ),
            title: Text(
              _worker.fullName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _worker.geo,
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                Text(
                  'Статус: доступен',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              const InfoView(
                title: 'Навыки',
                subtitle: Text('Мобильная разработка, Firebase, BLoC'),
              ),
              const InfoView(title: 'Средняя оценка', subtitle: RatingView()),
              const InfoView(
                title: 'Завершённых заказов',
                subtitle: Text('13'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: _callWorker,
                  icon: const Icon(Icons.phone),
                  label: const Text('Позвонить'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
