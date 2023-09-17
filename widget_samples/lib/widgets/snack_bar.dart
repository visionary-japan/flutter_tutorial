import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class SnackBarSample extends StatefulWidget {
  const SnackBarSample({super.key});

  @override
  State<SnackBarSample> createState() => _SnackBarSampleState();
}

class _SnackBarSampleState extends State<SnackBarSample> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'SnackBar Sample',
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('This is a snackbar'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {
                    // ボタンが押されたときに実行される処理
                  },
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: const Text('SnackBarを表示'),
        ),
      ),
    );
  }
}
