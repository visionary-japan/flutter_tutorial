import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class TimePickerSample extends StatefulWidget {
  const TimePickerSample({super.key});

  @override
  State<TimePickerSample> createState() => _TimePickerSampleState();
}

class _TimePickerSampleState extends State<TimePickerSample> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'TimePicker Sample',
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedTime.format(context),
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                ).then((time) {
                  setState(() {
                    _selectedTime = time ?? TimeOfDay.now();
                  });
                });
              },
              child: const Text('時刻を選択'),
            ),
          ],
        ),
      ),
    );
  }
}
