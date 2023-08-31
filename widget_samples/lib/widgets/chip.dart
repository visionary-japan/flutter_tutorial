import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';

class ChipSample extends StatelessWidget {
  const ChipSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Chip Sample',
      child: Center(
        child: Chip(
          avatar: Icon(Icons.person),
          label: Text('John Doe'),
          backgroundColor: Color.fromARGB(255, 100, 232, 255),
        ),
      ),
    );
  }
}
