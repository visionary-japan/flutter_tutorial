import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class StackAndPositionedSample extends StatelessWidget {
  const StackAndPositionedSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Stack and Positioned Sample',
      child: SizedBox(
        height: 500,
        width: 200,
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
