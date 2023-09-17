import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

enum RadioOption {
  one,
  two,
  three,
}

class RadioSample extends StatefulWidget {
  const RadioSample({super.key});

  @override
  State<RadioSample> createState() => _RadioSampleState();
}

class _RadioSampleState extends State<RadioSample> {
  RadioOption? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'RadioButton Sample',
      child: Center(
        child: Column(
          children: [
            Radio(
              value: RadioOption.one,
              groupValue: _selectedValue,
              onChanged: (value) {
                // ラジオボタンの値が変更されたときに実行される処理
                setState(() {
                  _selectedValue = value;
                });
              },
              activeColor: Colors.blue,
            ),
            Radio(
              value: RadioOption.two,
              groupValue: _selectedValue,
              onChanged: (value) {
                // ラジオボタンの値が変更されたときに実行される処理
                setState(() {
                  _selectedValue = value;
                });
              },
              activeColor: Colors.blue,
            ),
            Radio(
              value: RadioOption.three,
              groupValue: _selectedValue,
              onChanged: (value) {
                // ラジオボタンの値が変更されたときに実行される処理
                setState(() {
                  _selectedValue = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
