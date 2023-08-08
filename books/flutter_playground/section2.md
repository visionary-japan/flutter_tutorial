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
また、各説明ではウィジェットの概要と主要なパラメーターを紹介します。全量ではないため、詳細はドキュメント等を参照しましょう。

:::message
iOSに特化したCupertinoウィジェットというシリーズも存在しますがここでは割愛します。Materialウィジェットが理解できれば十分に理解ができるはずです。
:::

## Scaffold
`Scaffold`ウィジェットは、Flutterにおけるスクリーンの土台です。全ての画面には原則`Scaffold`ウィジェットが必要で、その上にコンポーネント（部品）をそれぞれ配置します。

![](https://storage.googleapis.com/zenn-user-upload/0c606489096f-20230809.png)

`Scaffold`ウィジェットは、以下のようなパラメーターが指定できます
- appBar: このプロパティに AppBar ウィジェットを指定することで、ページの上部にアプリバーを追加します。
- body: 画面の主要部分に配置するウィジェット。
- drawer: ドロワーメニューとして表示されるウィジェット。
- floatingActionButton: 画面上に浮かぶアクションボタン。
- bottomNavigationBar: 画面の下部に配置するナビゲーションバー。
- backgroundColor: 背景色の設定。

```dart
Scaffold(
  appBar: AppBar(
    title: Text('My Scaffold Example'),
  ),
  body: Center(
    child: Text('Hello, World!'),
  ),
  drawer: Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
    ],
  ),
)
```
## AppBar
`AppBar`は、`Scaffoldウィジェットに指定できるウィジェットで、画面上部にバーを配置するためのものです。

![](https://storage.googleapis.com/zenn-user-upload/ead0e24ce65d-20230809.png)

パラメーターは、以下のようなものを指定できます

- title: 中央に表示されるウィジェット、通常はテキスト。
- actions: 右側に配置するウィジェットのリスト。
- leading: 左側に配置するウィジェット、通常はドロワーのメニューアイコン。
- backgroundColor: 背景色。
- elevation: 影の大きさ。

```dart
AppBar(
  title: Text('My AppBar Example'),
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
  ],
  backgroundColor: Colors.blue,
  elevation: 5.0,
)
```

## Container
`Container`ウィジェットは、HTMLで言う`<div>`のようにchildに持つウィジェットの領域を確保したり、decorationで装飾したコンポーネントを作成することができます。

![](https://storage.googleapis.com/zenn-user-upload/05d7251a2abe-20230809.png)

`Container`ウィジェットには、以下のパラメーターが指定できます
- child: このコンテナ内に配置する唯一の子ウィジェット。
- margin: コンテナの外側の余白。
- padding: コンテナの内側の余白。
- decoration: ボックスに対する装飾（背景色、境界線など）。
- widthとheight: コンテナのサイズ。
- （color）:　背景色の指定。ただし、decorationとの共存は不可。

```dart
Container(
  margin: EdgeInsets.all(15.0),
  padding: EdgeInsets.all(10.0),
  decoration: BoxDecoration(
    color: Colors.blue,
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: Text('Hello, World!'),
)
```
## Text
`Text`ウィジェットは、文字列を表示するためのウィジェットです。styleのパラメーターを指定すればさらに装飾をすることができます。

![](https://storage.googleapis.com/zenn-user-upload/f7619a9fd712-20230809.png)

- 第一引数: String型のデータを指定します
- style: テキストのスタイル（色、フォントサイズ、フォントウェイトなど）。
- textAlign: テキストの揃え位置（左、右、中央など）。
- maxLines: 表示する最大行数。
- overflow: テキストがコンテナを超える場合の動作（省略、切り捨てなど）。

```dart
Text(
  'Hello, World!',
  style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```
## Column
`Column`ウィジェットは様々なウィジェットを縦並びにすることができます。

![](https://storage.googleapis.com/zenn-user-upload/ca8d15341497-20230809.png)

`Column`ウィジェットには以下のパラメーターが指定できます。
- children: 垂直に並べたい子ウィジェットのリスト。
- mainAxisAlignment: 主軸方向（この場合は垂直方向）の子ウィジェットの配置を制御する。
- crossAxisAlignment: 交差軸方向（この場合は水平方向）の子ウィジェットの配置を制御する。
- verticalDirection: 子ウィジェットの垂直方向の順序。
- mainAxisSize: 主軸のサイズを最小化または最大化するかを制御する。

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround, // 主軸方向の子ウィジェットの配置
  crossAxisAlignment: CrossAxisAlignment.stretch,  // 交差軸方向の子ウィジェットの配置
  mainAxisSize: MainAxisSize.min,                // 主軸のサイズを最小化
  verticalDirection: VerticalDirection.down,    // 子ウィジェットの垂直方向の順序
  children: <Widget>[
    Text('Hello, World!'),
    Text('Welcome to Flutter'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
)
```
## Row
`Row`ウィジェットは様々なウィジェットを横並びにすることができます。

![](https://storage.googleapis.com/zenn-user-upload/b2fed7a4c15b-20230809.png)

`Row`ウィジェットには以下のパラメーターが指定できます。

- children: 水平に並べたい子ウィジェットのリスト。
- mainAxisAlignment: 主軸方向（この場合は水平方向）の子ウィジェットの配置を制御する。
- crossAxisAlignment: 交差軸方向（この場合は垂直方向）の子ウィジェットの配置を制御する。
- verticalDirection: 子ウィジェットの垂直方向の順序。
- mainAxisSize: 主軸のサイズを最小化または最大化するかを制御する。
- textDirection: 子ウィジェットの水平方向のテキスト順序。

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主軸方向の子ウィジェットの配置
  crossAxisAlignment: CrossAxisAlignment.center,     // 交差軸方向の子ウィジェットの配置
  mainAxisSize: MainAxisSize.max,                   // 主軸のサイズを最大化
  verticalDirection: VerticalDirection.down,       // 子ウィジェットの垂直方向の順序
  textDirection: TextDirection.ltr,                // 子ウィジェットの水平方向のテキスト順序
  children: <Widget>[
    Text('Hello,'),
    Text('World!'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
)
```
## Stack / Positioned
`Stack`ウィジェットはウィジェットを重ねることができます。
また、`Stack`のchildrenに指定できる専用の`Positioned`というウィジェットもあります。
`Positioned`を用いればStackの重なりを微調整できます。

![](https://storage.googleapis.com/zenn-user-upload/c7786f74e28c-20230809.png)

`Stack`には以下のパラメーターが指定することができます
- alignment: childrenの並びを設定できます
- textDirection: childrenに指定したテキストの方向を設定します
- fit: 親領域まで引き伸ばし設定ができます
- children: 重ねるウィジェットを指定します。配列のindexが若い方が下の要素になります。

`Positioned`には以下のパラメーターを指定することができます
- top: 上からの余白
- right: 右からの余白
- left: 左からの余白
- bottom: 下からの余白

```dart
Stack(
  children: <Widget>[
    Container(
      color: Colors.red,
    ),
    Positioned(
      top: 100,
      left: 100,
      child: Container(
        color: Colors.blue,
      ),
    ),
  ],
)
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

