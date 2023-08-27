import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'AlertDialog Widget',
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('This is an alert dialog'),
                  content:
                      const Text('This is the content of the alert dialog.'),
                  actions: <Widget>[
                    OutlinedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        // ボタンが押されたときに実行される処理
                        Navigator.of(context).pop();
                      },
                    ),
                    OutlinedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        // ボタンが押されたときに実行される処理
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'ダイアログを開く',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
