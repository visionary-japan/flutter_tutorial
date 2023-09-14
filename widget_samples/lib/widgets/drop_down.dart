import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class DropDownSample extends StatefulWidget {
  const DropDownSample({super.key});

  @override
  State<DropDownSample> createState() => _DropDownSampleState();
}

class _DropDownSampleState extends State<DropDownSample> {
  String? _value = '選択肢1';

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'DropDown Sample',
      child: Center(
        child: DropdownButton(
          value: _value,
          items: const [
            DropdownMenuItem(
              value: '選択肢1',
              child: Text('選択肢1'),
            ),
            DropdownMenuItem(
              value: '選択肢2',
              child: Text('選択肢2'),
            ),
            DropdownMenuItem(
              value: '選択肢3',
              child: Text('選択肢3'),
            ),
          ],
          onChanged: (String? value) {
            // ドロップダウンリストの値が変更されたときに実行される処理
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
