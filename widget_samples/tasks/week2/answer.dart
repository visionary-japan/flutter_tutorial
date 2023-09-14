import 'package:flutter/material.dart';

void main() {
  runApp(const AppTheme());
}

class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Flutter 2',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.pink,
        ),
        actions: [
          Container(
            width: 60,
            height: 60,
            color: Colors.pink,
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blueAccent,
          child: Center(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
