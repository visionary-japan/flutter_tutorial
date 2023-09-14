import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 42, 42, 247)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter 3'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ListView(
              children: const [
                ColumnSample(),
                RowSample(),
                ColumnSample(),
              ],
            ),
            const Positioned(
              top: 60,
              left: 20,
              child: GreenContainer(),
            ),
            const Positioned(
              top: 60,
              right: 20,
              child: GreenContainer(),
            ),
            const Positioned(
              bottom: 200,
              left: 20,
              child: GreenContainer(),
            ),
            const Positioned(
              bottom: 200,
              right: 20,
              child: GreenContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnSample extends StatelessWidget {
  const ColumnSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          AmberLandscapeContainer(),
          BlueContainer(),
          AmberLandscapeContainer(),
        ],
      ),
    );
  }
}

class RowSample extends StatelessWidget {
  const RowSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          AmberPortraitContainer(),
          BlueContainer(),
          AmberPortraitContainer()
        ],
      ),
    );
  }
}

/// 青い正方形のパーツ
class BlueContainer extends StatelessWidget {
  const BlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

/// 緑の正方形のパーツ
class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

/// 黄色い横長のパーツ
class AmberLandscapeContainer extends StatelessWidget {
  const AmberLandscapeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

/// 黄色い縦長のパーツ
class AmberPortraitContainer extends StatelessWidget {
  const AmberPortraitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
