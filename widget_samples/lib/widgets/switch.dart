import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class SwitchSample extends StatefulWidget {
  const SwitchSample({super.key});

  @override
  State<SwitchSample> createState() => _SwitchSampleState();
}

class _SwitchSampleState extends State<SwitchSample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Switch Sample',
      child: Center(
        child: Switch(
          value: _selected,
          onChanged: (bool value) {
            // スイッチの値が変更されたときに実行される処理
            setState(() {
              _selected = value;
            });
          },
          activeColor: const Color.fromARGB(255, 33, 54, 243),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color.fromARGB(60, 49, 100, 254),
        ),
      ),
    );
  }
}
