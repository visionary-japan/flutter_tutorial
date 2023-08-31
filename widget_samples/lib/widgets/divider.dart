import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';

class DividerSample extends StatelessWidget {
  const DividerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Divider Sample',
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Divider(
                height: 10.0,
                color: Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
