import 'package:flutter/material.dart';

enum PopupMenuButtonType {
  one,
  two,
  three;
}

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
  PopupMenuButtonType _value = PopupMenuButtonType.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter 4'),
      ),
      body: SizedBox(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 5 / 2, // 比率で縦横サイズを調整
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              leading: Icon(Icons.star),
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: PopupMenuButton<PopupMenuButtonType>(
          icon: const Icon(Icons.settings),
          iconSize: 40,
          position: PopupMenuPosition.over,
          initialValue: PopupMenuButtonType.one,
          itemBuilder: (BuildContext context) {
            return const <PopupMenuEntry<PopupMenuButtonType>>[
              PopupMenuItem(
                value: PopupMenuButtonType.one,
                child: Text('選択肢1'),
              ),
              PopupMenuItem(
                value: PopupMenuButtonType.two,
                child: Text('選択肢2'),
              ),
              PopupMenuItem(
                value: PopupMenuButtonType.three,
                child: Text('選択肢3'),
              ),
            ];
          },
          onSelected: (PopupMenuButtonType value) {
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
