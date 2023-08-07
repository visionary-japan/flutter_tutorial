---
title: "基本のウィジェット"
---

:::message alert
この教材では、Flutterに注力して学習を進めます。そのため、クラスやメソッドなど、文法の基礎的な箇所については省略します
:::

# 1. Flutterの初期状態を確認しよう

立ち上げたアプリは、以下のようなフォルダ構造になっていると思います。
基本的には`lib`フォルダ配下にプロジェクトフォルダを作成していくのですが、Flutterはマルチプラットフォームに対応しています。
そのため、たとえばWebアプリを開発したければwebフォルダ、MacOSアプリを開発したければmacos配下を修正したりする場合があります。
Flutterは、パッケージや言語のシステムが豊富なのである程度やりたいことが実現できますが、どうしてもOSに依存する機能は苦手な場合があるためその場合は対象のOSフォルダに実装をした上、それをFlutterから呼び出すことで期待する機能の実現をする場合があります。
ただし、基本は`lib`フォルダを編集します。

![](https://storage.googleapis.com/zenn-user-upload/7905c2b8a5f6-20230808.png)

### アプリケーションの流れ
以下が、デフォルトの`main.dart`です。コメントアウトだけ削除した状態です。
```dart:main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

- まず、Dartは`main`関数がエンドポイントとなるため、必須となります。
- 次に、MaterialAppをreturnするクラスを１つ用意します。
- MaterialAppではアプリのテーマ等基本設定を行います
- 最後に、トップに表示したい画面をMaterialAppのhomeというプロパティで指定します。

詳しいウィジェットが知らない状態なので、軽い理解で大丈夫です。
次に、Flutterのウィジェット一覧を学習しましょう。
忘れたらこのセクションを振り返ってください。

# 2. Flutterの基本
公式にも[Widget catalog](https://docs.flutter.dev/ui/widgets)というのがありますが抜粋して基本的なウィジェット一覧を紹介します。

## Stateless/Stateful Widget
FlutterのStatelessWidgetとStatefulWidgetは、FlutterのUIを構築する基本的な要素です。StatelessWidgetは、状態を持たないウィジェットであり、StatefulWidgetは、状態を持つウィジェットです。

StatelessWidgetは、テキスト、画像、ボタンなどの静的なウィジェットを作成するために使用されます。StatelessWidgetは、ウィジェットの状態を変更することはできません。そのため、StatelessWidgetは、ユーザーの入力に応じてウィジェットの状態を変更する必要があるようなアプリケーションには適していません。

StatefulWidgetは、ユーザーの入力に応じてウィジェットの状態を変更する必要があるようなアプリケーションに適しています。StatefulWidgetは、ウィジェットの状態を変更するために、Stateクラスを使用します。Stateクラスは、ウィジェットの状態を保存し、ウィジェットの状態を変更するために必要なメソッドを提供します。

#### 小ネタ： Flutterのライフサイクルについて
また、別セクションで行いますが、StatefulWidgetを用いることでFlutterのライフサイクルが利用できるようになります。

https://flutterbyexample.com/lesson/stateful-widget-lifecycle

:::message
上記で紹介するのは、あくまでFlutterのライフサイクルです。アプリを起動しているOS本体のライフサイクルも存在するため、混同しないようにお気をつけください。
:::

## Flutterの作法
FlutterはDartであることから、「良いコード、悪いコード」や「リーダブルコード」のような書籍より優先される基準であるEffective Dartというものがあります。
こちらは慣れてきてからでも良いので、一度目を通すようにしてください。

https://dart.dev/effective-dart

# 3.Widget一覧（抜粋）
Flutterは、以下のようなWidgetを用いながらアプリ開発を行います。
その他、パッケージを入れることで活用できるウィジェットなどもあるのですがここでは一旦
Flutter（Google）が採用しているマテリアルデザインに準拠したウィジェットの紹介をします。
:::message
iOSに特化したCupertinoウィジェットというシリーズも存在しますがここでは割愛します。Materialウィジェットが理解できれば十分に理解ができるはずです。
:::

## Scaffold
```dart
```
## AppBar
```dart
```
## Container
```dart
```
## Text
```dart
```
## Column
```dart
```
## Row
```dart
```
## Stack
```dart
```
## ListView
```dart
```
## GridView
```dart
```
## Button
```dart
```
## FloatingActionButton
```dart
```
## DropdownButton
```dart
```
## PopupMenuButton
```dart
```
## Checkbox
```dart
```
## Radio
```dart
```
## Switch
```dart
```
## Slider
```dart
```
## Date & Time Pickers
```dart
```
## SnackBar
```dart
```
## AlertDialog
```dart
```
## BottomNavigationBar
```dart
```
## TabBar
```dart
```
## Drawer
```dart
```
## Tooltip
```dart
```
## Card
```dart
```
## DataTable
```dart
```
## Image
```dart
```
## Icon
```dart
```
## Chip
```dart
```
## Divider
```dart
```
## ProgressIndicator
```dart
```
## TextField
```dart
```
## SelectableText
```dart
```
## RichText
```dart
```
## InkWell
```dart
```
## GestureDetector
```dart
```
## FutureBuilder
```dart
```
## StreamBuilder
```dart
```
## AnimatedContainer
```dart
```
## Hero
```dart
```
## Transform
```dart
```
## Wrap
```dart
```
## Align
```dart
```
## Center
```dart
```
## Expanded
```dart
```
## Positioned
```dart
```
## AspectRatio
```dart
```
## InheritedWidget
```dart
```
## CustomScrollView
```dart
```
## SliverAppBar
```dart
```
## SliverList
```dart
```
## SliverGrid
```dart
```
## SliverFixedExtentList
```dart
```
## SliverToBoxAdapter
```dart
```
## SliverPadding
```dart
```
## SliverFillViewport
```dart
```
## SliverFillRemaining
```dart
```
## SliverAnimatedList
```dart
```


以上です！
まだまだFlutter系ウィジェットはたくさんあるので気になった方は調べてみてください！

