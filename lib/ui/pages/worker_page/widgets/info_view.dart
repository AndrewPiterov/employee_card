import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({required this.title, required this.subtitle, super.key});

  final String title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), subtitle: subtitle);
  }
}
