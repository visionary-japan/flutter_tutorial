import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class CheckBoxSample extends StatefulWidget {
  const CheckBoxSample({super.key});

  @override
  State<CheckBoxSample> createState() => _CheckBoxSampleState();
}

class _CheckBoxSampleState extends State<CheckBoxSample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'CheckBox Sample',
      child: Center(
        child: Checkbox(
          value: _isChecked,
          onChanged: (value) {
            // チェックボックスの値が変更されたときに実行される処理
            setState(() {
              _isChecked = value ?? false;
            });
          },
          activeColor: Colors.red,
          checkColor: Colors.white,
          tristate: false,
        ),
      ),
    );
  }
}
