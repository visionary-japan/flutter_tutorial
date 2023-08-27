import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ToolTipSample extends StatelessWidget {
  const ToolTipSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Tooltip Sample',
      child: Center(
        child: Tooltip(
          message: 'Your Tooltip Message',
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 251, 132, 34),
              Color.fromARGB(255, 236, 33, 255)
            ]),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          preferBelow: false,
          textStyle: const TextStyle(fontSize: 15, color: Colors.white),
          showDuration: const Duration(seconds: 2),
          waitDuration: const Duration(milliseconds: 500),
          child: const Icon(
            Icons.star_border_purple500_outlined,
            size: 60,
          ),
        ),
      ),
    );
  }
}
