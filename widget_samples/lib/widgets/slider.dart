import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class SliderSample extends StatefulWidget {
  const SliderSample({super.key});

  @override
  State<SliderSample> createState() => _SliderSampleState();
}

class _SliderSampleState extends State<SliderSample> {
  double _value = 30;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Slider Sample',
      child: Center(
        child: Slider(
          value: _value,
          min: 0,
          max: 100,
          divisions: 20,
          label: _value.toString(),
          onChanged: (double value) {
            // スライダーの値が変更されたときに実行される処理
            setState(() {
              _value = value;
            });
          },
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
        ),
      ),
    );
  }
}
