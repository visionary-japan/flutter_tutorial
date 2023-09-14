import 'package:flutter/material.dart';

class FloatingActionButtonSample extends StatelessWidget {
  const FloatingActionButtonSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Sample'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 4.0,
        mini: false,
        child: const Icon(Icons.add),
      ),
    );
  }
}
