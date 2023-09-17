import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class DateTimePickerSample extends StatefulWidget {
  const DateTimePickerSample({super.key});

  @override
  State<DateTimePickerSample> createState() => _DateTimePickerSampleState();
}

class _DateTimePickerSampleState extends State<DateTimePickerSample> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'DateTimePicker Sample',
      child: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(selectedDate.toString()),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.parse('2000-01-01'),
                    lastDate: DateTime.now(),
                    locale: const Locale('ja', 'JP'),
                  ).then((value) {
                    setState(() {
                      selectedDate = value ?? DateTime.now();
                    });
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('showDatePicker'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
