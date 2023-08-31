import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';

class IconSample extends StatelessWidget {
  const IconSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Icon Sample',
      child: Center(
        child: Icon(
          Icons.home,
          size: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
