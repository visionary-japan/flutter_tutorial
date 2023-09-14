import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ElevatedButtonSample extends StatelessWidget {
  const ElevatedButtonSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'ElevatedButton Sample',
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // ボタンの色を青に設定
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // 角丸の半径を設定
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Click Me',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
