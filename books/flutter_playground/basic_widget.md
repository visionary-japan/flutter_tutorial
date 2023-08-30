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

#### 小ネタ1： Flutterのライフサイクルについて
また、別セクションで行いますが、StatefulWidgetを用いることでFlutterのライフサイクルが利用できるようになります。

https://flutterbyexample.com/lesson/stateful-widget-lifecycle

:::message
上記で紹介するのは、あくまでFlutterのライフサイクルです。アプリを起動しているOS本体のライフサイクルも存在するため、混同しないようにお気をつけください。
:::

#### 小ネタ2: なぜStatefulWidgetは2つのクラスがあるか

FlutterのStatefulWidgetは、状態を保持するWidgetです。画面の状態が変化するたびに、Widgetを再描画する必要があります。

StatefulWidgetを使う際、StatefulWidgetを継承したクラスとStateを継承したクラスの2つが必要になる理由は、以下のとおりです。

StatefulWidgetは、画面の状態を管理する責務を持ちます。 画面の状態とは、例えば、テキストの値、ボタンの状態、画像の表示状態などです。StatefulWidgetは、これらの状態を保持し、必要に応じて更新します。
Stateは、画面の描画を行う責務を持ちます。 StatefulWidgetは、Stateを保持し、Stateの状態に応じて画面を描画します。
StatefulWidgetとStateの関係は、親子関係に相当します。StatefulWidgetは、Stateの作成と管理を行います。Stateは、StatefulWidgetの状態を保持し、必要に応じて更新します。

サンプルコードを以下に示します。

```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
```

このコードでは、CounterクラスがStatefulWidgetを継承し、_CounterStateクラスがStateを継承しています。Counterクラスは、カウンターの値を保持するcountフィールドを定義しています。_CounterStateクラスは、increment()メソッドを定義し、カウンターの値を1増やす処理を行っています。build()メソッドは、画面にカウンターの値を表示するテキストを表示します。

increment()メソッドを呼び出すと、countフィールドの値が更新されます。countフィールドの値が更新されると、setState()メソッドが呼び出され、画面が再描画されます。

このように、StatefulWidgetとStateは、密接に関連し、互いに依存しています。StatefulWidgetは、Stateの作成と管理を行い、Stateは、StatefulWidgetの状態に応じて画面を描画します。

## Flutterの作法
FlutterはDartであることから、「良いコード、悪いコード」や「リーダブルコード」のような書籍より優先される基準であるEffective Dartというものがあります。
こちらは慣れてきてからでも良いので、一度目を通すようにしてください。

https://dart.dev/effective-dart


# 3.Widget一覧（抜粋）
Flutterは、以下のようなWidgetを用いながらアプリ開発を行います。
その他、パッケージを入れることで活用できるウィジェットなどもあるのですがここでは一旦
Flutter（Google）が採用しているマテリアルデザインに準拠したウィジェットの紹介をします。
また、各説明ではウィジェットの概要と主要なパラメーターを紹介します。全量ではないため、詳細はドキュメント等を参照しましょう。

### Material library
https://api.flutter.dev/flutter/material/material-library.html#classes

### Widgets library
https://api.flutter.dev/flutter/widgets/widgets-library.html#classes

:::message
iOSに特化したCupertinoウィジェットというシリーズも存在しますがここでは割愛します。Materialウィジェットが理解できれば十分に理解ができるはずです。
:::

## Scaffold

https://api.flutter.dev/flutter/material/Scaffold-class.html

`Scaffold`ウィジェットは、Flutterにおけるスクリーンの土台です。全ての画面には原則`Scaffold`ウィジェットが必要で、その上にコンポーネント（部品）をそれぞれ配置します。

![](https://storage.googleapis.com/zenn-user-upload/0c606489096f-20230809.png)

`Scaffold`ウィジェットは、以下のようなパラメーターが指定できます
- appBar: このプロパティに AppBar ウィジェットを指定することで、ページの上部にアプリバーを追加します。
- body: 画面の主要部分に配置するウィジェット。
- drawer: ドロワーメニューとして表示されるウィジェット。（左から登場）
- endDrawer: ドロワーメニューを右から出せます
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

https://api.flutter.dev/flutter/material/AppBar-class.html

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

https://api.flutter.dev/flutter/widgets/Container-class.html

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

https://api.flutter.dev/flutter/widgets/Text-class.html

`Text`ウィジェットは、文字列を表示するためのウィジェットです。styleのパラメーターを指定すればさらに装飾をすることができます。

![](https://storage.googleapis.com/zenn-user-upload/f7619a9fd712-20230809.png)

`Text`ウィジェットには以下のパラメーターが指定できます
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
## Center
https://api.flutter.dev/flutter/widgets/Center-class.html
`Center`ウィジェットは、childの要素を親要素の中央に配置する手軽なウィジェットになります。

単純なウィジェットかもしれませんが、以下のパラメーターを指定することができある程度カスタム可能です。
- widthFactor: この値が設定されている場合、Centerウィジェットの幅は、子ウィジェットの幅にこの値を掛けたものになります。例えば、2.0を設定すると、子ウィジェットの幅の2倍の幅を持つようになります。
- heightFactor: この値が設定されている場合、Centerウィジェットの高さは、子ウィジェットの高さにこの値を掛けたものになります。例えば、1.5を設定すると、子ウィジェットの高さの1.5倍の高さを持つようになります。
- child: Centerウィジェットの中央に配置するウィジェットを指定します。これが中央に表示される内容となります。

```dart
Center(
  widthFactor: 2.0,
  heightFactor: 1.5,
  child: Text('中央に配置されたテキスト'),
)
```
上記の例は、テキストを中央に配置し、そのテキストの幅の2倍、高さの1.5倍のサイズを持つCenterウィジェットを作成します。

## Column

https://api.flutter.dev/flutter/widgets/Column-class.html

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

https://api.flutter.dev/flutter/widgets/Row-class.html

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

https://api.flutter.dev/flutter/widgets/Stack-class.html

https://api.flutter.dev/flutter/widgets/Positioned-class.html

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
- child: 子要素

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

https://api.flutter.dev/flutter/widgets/ListView-class.html

`ListView`ウィジェットは、リストビューを作成するために使用されます。リストビューとは、複数の項目を横に並べて表示するウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/a3a2202911a6-20230815.png)

ListViewウィジェットには以下のパラメーターが指定できます。

- children: リストに表示する項目のリスト。
- scrollDirection: リストのスクロール方向。デフォルトはAxis.horizontal (横方向)。
- physics: リストの物理シミュレーション。デフォルトはClampingScrollPhysics (スクロールが一定範囲に制限される)。
- shrinkWrap: リストのサイズを自動的に調整するかどうか。デフォルトはfalse (サイズを固定する)。
- padding: リストの余白。

```dart
ListView(
  children: <Widget>[
    Text('Hello,'),
    Text('World!'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
);
```
## GridView

https://api.flutter.dev/flutter/widgets/GridView-class.html

`GridView`ウィジェットは、グリッドビューを作成するために使用されます。グリッドビューとは、複数の項目を縦横に並べて表示するウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/72874fad59ed-20230815.png)

`GridView`ウィジェットには以下のパラメーターが指定できます。
- children: グリッドに表示する項目のリスト。
- gridDelegate: グリッドのレイアウトを決定するウィジェット。デフォルトはSliverGridDelegateWithFixedCrossAxisCount (グリッドの列数を指定できる)。
- scrollDirection: グリッドのスクロール方向。デフォルトはAxis.horizontal (横方向)。
- physics: グリッドの物理シミュレーション。デフォルトはClampingScrollPhysics (スクロールが一定範囲に制限される)。
- shrinkWrap: グリッドのサイズを自動的に調整するかどうか。デフォルトはfalse (サイズを固定する)。
- padding: グリッドの余白。

```dart
GridView(
  children: <Widget>[
    Text('Hello,'),
    Text('World!'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, // グリッドの列数を3に設定
  ),
);
```

## ListTile
https://api.flutter.dev/flutter/material/ListTile-class.html

ListTileは、テキストと先頭または末尾のアイコンを含む固定の高さの行を表します。ListTileは、アイコンや他のウィジェット（チェックボックスなど）でフランクされた1〜3行のテキストを含むことができます。タイルのアイコン（または他のウィジェット）は、leadingおよびtrailingパラメータで定義されます。テキストの最初の行はオプションではなく、titleで指定されます。オプションのsubtitleの値は、追加のテキスト行のスペースを占有するか、isThreeLineがtrueの場合は2行を占有します。denseがtrueの場合、このタイルの全体の高さと、タイトルとサブタイトルウィジェットをラップするDefaultTextStylesのサイズが縮小されます。

![](https://storage.googleapis.com/zenn-user-upload/4943cee4f3df-20230827.png =250x)

ListTileは以下のパラメーターを持ちます

- leading: タイトルの前に表示するウィジェット。
- title: タイルの主要なコンテンツ。
- subtitle: タイトルの下に表示する追加のコンテンツ。
- trailing: タイトルの後に表示するウィジェット。
- isThreeLine: タイルが3行のテキストを表示するかどうか。
- dense: タイルが垂直に密集したリストの一部であるかどうか。
- enabled: このリストタイルがインタラクティブであるかどうか。
- onTap: タイルがタップされたときのコールバック。
- onLongPress: タイルが長押しされたときのコールバック。

```dart
ListTile(
  leading: Icon(Icons.star),
  title: Text('タイトル'),
  subtitle: Text('サブタイトル'),
  trailing: Icon(Icons.arrow_forward),
  isThreeLine: false,
  dense: false,
  enabled: true,
  onTap: () {
    // タップ時の処理
  },
  onLongPress: () {
    // 長押し時の処理
  },
)
```

## ElevatedButton
https://api.flutter.dev/flutter/material/ElevatedButton-class.html

`ElevatedButton`ウィジェットは、押し下げ可能なボタンを作成するために使用されます。

![](https://storage.googleapis.com/zenn-user-upload/77604cf08979-20230815.png)

`ElevatedButton`ウィジェットには以下のパラメーターが指定できます。

- onPressed: ボタンが押されたときに呼び出される関数。
- child: ボタンに表示するウィジェット。
- style: ボタンのスタイル。

```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Click Me'),
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // ボタンの色を青に設定
  ),
);
```
## FloatingActionButton
https://api.flutter.dev/flutter/material/FloatingActionButton-class.html

`FloatingActionButton`ウィジェットは、画面の下部に配置される丸いボタンを作成するために使用されます。主に、ユーザーが画面の下部からすばやく操作できるようにするために使用されます。

![](https://storage.googleapis.com/zenn-user-upload/eb53d7f6b9fc-20230815.png)

`FloatingActionButton`ウィジェットには以下のパラメーターが指定できます。

- onPressed: ボタンが押されたときに呼び出される関数。
- child: ボタンに表示するウィジェット。
- backgroundColor: ボタンの背景色。
- foregroundColor: ボタンの文字色。
- elevation: ボタンの影の深さ。
- mini: ボタンを小さくするかどうか。

```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
  backgroundColor: Colors.red,
  foregroundColor: Colors.white,
  elevation: 4.0,
  mini: false,
);
```
## DropdownButton
https://api.flutter.dev/flutter/material/DropdownButton-class.html

`DropdownButton`ウィジェットは、ドロップダウンリストを作成するために使用されます。ドロップダウンリストは、ユーザーが複数の選択肢から選ぶことができるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/ee6413c8f12e-20230815.png)

`DropdownButton`ウィジェットには以下のパラメーターが指定できます。
- value: ドロップダウンリストで選択されている値。
- items: ドロップダウンリストに表示する項目のリスト。
- onChanged: ドロップダウンリストの値が変更されたときに呼び出される関数。
- style: ドロップダウンリストのスタイル。

```dart
DropdownButton(
  value: '選択してください',
  items: [
    DropdownMenuItem(
      value: '選択肢1',
      child: Text('選択肢1'),
    ),
    DropdownMenuItem(
      value: '選択肢2',
      child: Text('選択肢2'),
    ),
  ],
  onChanged: (String value) {
    // ドロップダウンリストの値が変更されたときに実行される処理
  },
);
```
## PopupMenuButton
https://api.flutter.dev/flutter/material/PopupMenuButton-class.html

PopupMenuButtonウィジェットは、ポップアップメニューを作成するために使用されます。ポップアップメニューは、ユーザーが特定の項目を選択できるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/83ae4281ee9f-20230815.png)

PopupMenuButtonウィジェットには以下のパラメーターが指定できます。
- items: ポップアップメニューに表示する項目のリスト。
- onSelected: ポップアップメニューの項目が選択されたときに呼び出される関数。
- child: ポップアップメニューの親ウィジェット。
```dart
PopupMenuButton(
  items: [
    PopupMenuItem(
      value: '項目1',
      child: Text('項目1'),
    ),
    PopupMenuItem(
      value: '項目2',
      child: Text('項目2'),
    ),
  ],
  onSelected: (String value) {
    // ポップアップメニューの項目が選択されたときに実行される処理
  },
);
```
## Checkbox
https://api.flutter.dev/flutter/material/Checkbox-class.html

Checkboxウィジェットは、チェックボックスを作成するために使用されます。チェックボックスは、ユーザーが特定のオプションをオン/オフにできるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/5c1f36425943-20230825.png)

Checkboxウィジェットには以下のパラメーターが指定できます。
- value: チェックボックスの値。
- onChanged: チェックボックスの値が変更されたときに呼び出される関数。
- activeColor: チェックボックスがオンになっている時の色。
- checkColor: チェックボックスのチェックマークの色。
- tristate: チェックボックスに3つの状態(オン、オフ、どちらでもない)があるかどうか。

```dart
Checkbox(
  value: _isChecked,
  onChanged: (bool value) {
    // チェックボックスの値が変更されたときに実行される処理
    _isChecked = value;
  },
  activeColor: Colors.red,
  checkColor: Colors.white,
  tristate: false,
);
```
## Radio
https://api.flutter.dev/flutter/material/Radio-class.html

Radioウィジェットは、ラジオボタンを作成するために使用されます。ラジオボタンは、ユーザーが複数の選択肢から1つのオプションを選択できるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/abce2d31be22-20230815.png)

Radioウィジェットには以下のパラメーターが指定できます。

- value: ラジオボタンの値。
- groupValue: ラジオボタンのグループの値。
- onChanged: ラジオボタンの値が変更されたときに呼び出される関数。
- activeColor: ラジオボタンがオンになっている時の色。
- checkColor: ラジオボタンのチェックマークの色。

```dart
Radio(
  value: '選択肢1',
  groupValue: _selectedValue,
  onChanged: (String value) {
    // ラジオボタンの値が変更されたときに実行される処理
    _selectedValue = value;
  },
  activeColor: Colors.red,
  checkColor: Colors.white,
);
```
## Switch
https://api.flutter.dev/flutter/material/Switch-class.html

Switchウィジェットは、スイッチを作成するために使用されます。スイッチは、ユーザーがオン/オフを切り替えることができるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/e192ba0daa01-20230815.png)

Switchウィジェットには以下のパラメーターが指定できます。

- value: スイッチの値。
- onChanged: スイッチの値が変更されたときに呼び出される関数。
- activeColor: スイッチがオンになっている時の色。
- inactiveThumbColor: スイッチのオフになっている時の色。
- inactiveTrackColor: スイッチのトラックの色。
```dart
Switch(
  value: _isOn,
  onChanged: (bool value) {
    // スイッチの値が変更されたときに実行される処理
    _isOn = value;
  },
  activeColor: Colors.red,
  inactiveThumbColor: Colors.white,
  inactiveTrackColor: Colors.grey,
);
```
## Slider
https://api.flutter.dev/flutter/material/Slider-class.html

Sliderウィジェットは、スライダーを作成するために使用されます。スライダーは、ユーザーが値を調整できるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/333ec1362185-20230815.png)

Sliderウィジェットには以下のパラメーターが指定できます。

- value: スライダーの値。
- min: スライダーの最小値。
- max: スライダーの最大値。
- divisions: スライダーの分割数。
- label: スライダーの値の表示ラベル。
- onChanged: スライダーの値が変更されたときに呼び出される関数。
- activeColor: スライダーのハンドルの色。
- inactiveColor: スライダーのトラックの色。

```dart
Slider(
  value: _value,
  min: 0,
  max: 100,
  divisions: 10,
  label: 'Value',
  onChanged: (double value) {
    // スライダーの値が変更されたときに実行される処理
    _value = value;
  },
  activeColor: Colors.red,
  inactiveColor: Colors.grey,
);
```
## DatePickerDialog

https://api.flutter.dev/flutter/material/DatePickerDialog-class.html

https://api.flutter.dev/flutter/material/showDatePicker.html

`DatePickerDialog`ウィジェットは、日付選択ダイアログを作成するために使用されます。日付選択ダイアログは、ユーザーが日付を選択できるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/6f65f702b522-20230815.png)

DatePickerウィジェットには以下のパラメーターが指定できます。

- value: 日付ピッカーで選択されている日付。
- firstDate: 日付ピッカーで選択できる最小日付。
- lastDate: 日付ピッカーで選択できる最大日付。
- initialDate: 日付ピッカーで最初に表示される日付。
- onChanged: 日付ピッカーで選択された日付が変更されたときに呼び出される関数。
- style: 日付ピッカーのスタイル。

```dart
DatePickerDialog(
  value: _selectedDate,
  firstDate: DateTime.now(),
  lastDate: DateTime.now().add(Duration(days: 365)),
  initialDate: DateTime.now(),
  onChanged: (DateTime value) {
    // 日付ピッカーで選択された日付が変更されたときに実行される処理
    _selectedDate = value;
  },
  style: DatePickerStyle(
    backgroundColor: Colors.white,
    hintText: 'Select a date',
    datePickerMode: DatePickerMode.day,
  ),
);
```

## TimePickerDialog
https://api.flutter.dev/flutter/material/TimePickerDialog-class.html

TimePickerウィジェットは、時間ピッカーを作成するために使用されます。時間ピッカーは、ユーザーが時間を選択できるウィジェットです。

![](https://storage.googleapis.com/zenn-user-upload/e8c345c1bcd8-20230815.png)

`TimePickerDialog`ウィジェットには以下のパラメーターが指定できます。

- value: 時間ピッカーで選択されている時間。
- initialTime: 時間ピッカーで最初に表示される時間。
- onChanged: 時間ピッカーで選択された時間が変更されたときに呼び出される関数。
- style: 時間ピッカーのスタイル。

```Dart

```

## SnackBar
https://api.flutter.dev/flutter/material/SnackBar-class.html

![](https://storage.googleapis.com/zenn-user-upload/e5512701440e-20230815.png)

SnackBarウィジェットは、画面下部に表示されるメッセージボックスです。ユーザーに重要な情報を通知したり、アクションを促したりするために使用できます。

SnackBarウィジェットには以下のパラメーターが指定できます。

- content: メッセージボックスに表示されるテキスト。
- action: メッセージボックスに表示されるボタン。
- duration: メッセージボックスが表示される時間。

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('This is a snackbar'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // ボタンが押されたときに実行される処理
      },
    ),
    duration: Duration(seconds: 2),
  ),
);
```
## AlertDialog
https://api.flutter.dev/flutter/material/AlertDialog-class.html

AlertDialogウィジェットは、ユーザーに確認メッセージを表示するためのウィジェットです。ユーザーに確認を求めたり、警告メッセージを表示したりするために使用できます。

![](https://storage.googleapis.com/zenn-user-upload/a17472a2f5f9-20230827.png =250x)

AlertDialogウィジェットには以下のパラメーターが指定できます。

- title: ダイアログのタイトル。
- content: ダイアログのコンテンツ。
- actions: ダイアログに表示されるボタン。

```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('This is an alert dialog'),
      content: Text('This is the content of the alert dialog.'),
      actions: <Widget>[
        OutlinedButton(
          child: Text('OK'),
          onPressed: () {
            // ボタンが押されたときに実行される処理
            Navigator.of(context).pop();
          },
        ),
        OutlinedButton(
          child: Text('Cancel'),
          onPressed: () {
            // ボタンが押されたときに実行される処理
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
```
## BottomNavigationBar
https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

画面下部にナビゲーションバーを作成するためのウィジェットです。通常、3〜5のボタンを配置するようになります。
原則、画面遷移をしても変化しないバーになります。

![](https://storage.googleapis.com/zenn-user-upload/2932b328e406-20230827.png =250x)

`BottomNavigationBar`は以下のパラメーターを持ちます
- items: ナビゲーションバー内のアイテムを定義します。これらのアイテムは、テキストラベル、アイコン、またはその両方で構成されることがあります。
- onTap: アイテムがタップされたときに呼び出されるコールバック関数です。
- currentIndex: 現在アクティブなアイテムのインデックスです。
- elevation: BottomNavigationBarのz座標です。
- type: ナビゲーションバーのタイプ（fixedまたはshifting）を定義します。
- backgroundColor: ナビゲーションバー自体の色です。
- iconSize: すべてのBottomNavigationBarItemアイコンのサイズです。
- selectedItemColor: 選択されたアイテムのアイコンとラベルの色です。
- unselectedItemColor: 選択されていないアイテムのアイコンとラベルの色です。
- selectedFontSize: 選択されたアイテムラベルのフォントサイズです。
- unselectedFontSize: 選択されていないアイテムラベルのフォントサイズです。
- showSelectedLabels: 選択されたBottomNavigationBarItemのラベルを表示するかどうか。
- showUnselectedLabels: 選択されていないBottomNavigationBarItemsのラベルを表示するかどうか。

```dart
BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'School',
    ),
  ],
  onTap: (index) {
    // タップされたアイテムのインデックスを処理
  },
  currentIndex: 0,
  elevation: 8.0,
  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.white,
  iconSize: 24.0,
  selectedItemColor: Colors.red,
  unselectedItemColor: Colors.grey,
  selectedIconTheme: IconThemeData(color: Colors.red),
  unselectedIconTheme: IconThemeData(color: Colors.grey),
  selectedFontSize: 14.0,
  unselectedFontSize: 12.0,
  selectedLabelStyle: TextStyle(color: Colors.red),
  unselectedLabelStyle: TextStyle(color: Colors.grey),
  showSelectedLabels: true,
  showUnselectedLabels: false,
  mouseCursor: SystemMouseCursors.click,
  enableFeedback: true,
  landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
  useLegacyColorScheme: true,
),
```
## TabBar / DefaultTabController
https://api.flutter.dev/flutter/material/TabBar-class.html

TabBarウィジェットは、Material Designの主要なタブバーを作成するために使用されます。主要なタブは、上部アプリバーの下のコンテンツペインの上部に配置され、主要なコンテンツの目的地を表示します。

![](https://storage.googleapis.com/zenn-user-upload/bd9845e16b12-20230827.png =250x)

- tabs: タブのリスト。通常、2つ以上のTabウィジェットが含まれます。
- controller: タブの選択とアニメーションの状態を制御します。
- isScrollable: タブバーが水平方向にスクロール可能かどうか。
- indicatorColor: 選択されたタブの下に表示されるラインの色。
- indicatorWeight: 選択されたタブの下に表示されるラインの厚さ。
- indicatorPadding: インジケータのパディング。
- labelColor: 選択されたタブラベルの色。
- unselectedLabelColor: 選択されていないタブラベルの色。
- mouseCursor: 個々のタブウィジェット上でマウスポインタが入るかホバーするときのカーソル。
- onTap: タブバーがタップされたときに呼び出されるオプションのコールバック。

#### 単純なTab設定

```dart
TabBar(
  tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
  controller: _tabController,
  isScrollable: true,
  indicatorColor: Colors.blue,
  indicatorWeight: 2.0,
  indicatorPadding: EdgeInsets.zero,
  labelColor: Colors.black,
  unselectedLabelColor: Colors.grey,
  mouseCursor: SystemMouseCursors.click,
  onTap: (index) {
    // タブがタップされたときの処理
  },
)
```

#### DefaultTabControllerを用いた簡易的なサンプル
```Dart
DefaultTabController(
  length: 3, // タブの数
  child: Scaffold(
    appBar: AppBar(
      title: const Text('TabBar Sample'),
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.business), text: 'Business'),
          Tab(icon: Icon(Icons.school), text: 'School'),
        ],
      ),
    ),
    body: const TabBarView(
      children: [
        Center(child: Text('Home Tab')),
        Center(child: Text('Business Tab')),
        Center(child: Text('School Tab')),
      ],
    ),
  ),
);
```

## Drawer
https://api.flutter.dev/flutter/material/Drawer-class.html

Drawerウィジェットは、FlutterのMaterial Designパネルで、Scaffoldの端から水平にスライドしてアプリケーション内のナビゲーションリンクを表示します。

![](https://storage.googleapis.com/zenn-user-upload/2318ce30471f-20230827.png =250x)

- backgroundColor: Drawerの内容を保持するマテリアルの色。
- elevation: Drawerを親に対して配置するz座標。
- shadowColor: Drawerのマテリアルの下に描画されるドロップシャドウの色。
- surfaceTintColor: Drawerの背景色に対する表面の色合い。
- shape: Drawerの形状。
- width: Drawerの幅。
- child: 木構造の下のウィジェット。
- semanticLabel: Drawerが開いたり閉じたりする際に、アクセシビリティフレームワークが画面遷移を発表するためのセマンティックラベル。
- clipBehavior: このオプションに従ってコンテンツがクリップされるかどうか。


```dart
Scaffold(
 appBar: AppBar(
   title: const Text('Drawer Demo'),
 ),
 // drawerは左から登場し、endDrawerは右から登場するものです
 endDrawer: Drawer(
   child: ListView(
     padding: EdgeInsets.zero,
     children: const <Widget>[
       DrawerHeader(
         decoration: BoxDecoration(
           color: Colors.blue,
         ),
         child: Text(
           'Drawer Header',
           style: TextStyle(
             color: Colors.white,
             fontSize: 24,
           ),
         ),
       ),
       ListTile(
         leading: Icon(Icons.message),
         title: Text('Messages'),
       ),
       ListTile(
         leading: Icon(Icons.account_circle),
         title: Text('Profile'),
       ),
       ListTile(
         leading: Icon(Icons.settings),
         title: Text('Settings'),
       ),
     ],
   ),
 ),
)
```
## Tooltip
https://api.flutter.dev/flutter/material/Tooltip-class.html

Tooltipクラスは、ボタンや他のユーザーインターフェイスアクションの機能を説明するテキストラベルを提供します。

![](https://storage.googleapis.com/zenn-user-upload/fd5d6525f3e9-20230827.png =250x)


Tooltipクラスは以下のようなパラメーターを持ちます

- message: ツールチップに表示するテキスト。
- height: ツールチップの高さ。
- padding: ツールチップの子要素の内側の余白。
- margin: ツールチップを囲む空白の量。
- preferBelow: ツールチップがウィジェットの下に表示されるかどうか。
- decoration: ツールチップの形状と背景色。
- textStyle: ツールチップのメッセージのスタイル。
- waitDuration: ツールチップが表示されるまでの待機時間。
- showDuration: ツールチップが表示される時間。

```dart
Tooltip(
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
```
## Card
https://api.flutter.dev/flutter/material/Card-class.html

Cardは、マテリアルデザインのカードを表現するウィジェットです。わずかに丸みを帯びた角とエレベーションの影が特徴です。カードは、アルバム、地理的な場所、食事、連絡先の詳細など、関連する情報を表現するためのマテリアルのシートとして使用されます。

`Card`ウィジェットは以下のパラメーターを持ちます
- color: カードの背景色。
- shadowColor: カードの下の影の色。
- elevation: このカードを配置するz座標。これはカードの下の影のサイズを制御します。
- shape: カードのマテリアルの形状。
- borderOnForeground: 子の前に形状の境界線を描画するかどうか。
- margin: カードを囲む空白の量。
- clipBehavior: このオプションに従ってコンテンツがクリップされるかどうか。
- child: このウィジェットの下にあるウィジェット。
- semanticContainer: このウィジェットが単一のセマンティックコンテナを表すか、またはfalseの場合、個々のセマンティックノードのコレクション。

```dart
Card(
  color: Colors.blue,
  shadowColor: Colors.grey,
  elevation: 5.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  borderOnForeground: true,
  margin: EdgeInsets.all(10.0),
  child: ListTile(
    leading: Icon(Icons.album),
    title: Text('Album Title'),
    subtitle: Text('Description of the album.'),
  ),
)
```
## DataTable
https://api.flutter.dev/flutter/material/DataTable-class.html

DataTableは、行と列の形式でデータを表示するためのMaterial Designのウィジェットです。各行はDataRowで、各列はDataColumnで表されます。データテーブルは、ユーザーが情報を一覧で確認しやすくするためのものです。

DataTableクラスは以下のようなパラメーターを持ちます

- columns: テーブルの列を定義するDataColumnのリスト。
- rows: テーブルの行を定義するDataRowのリスト。
- sortColumnIndex: ソートされる列のインデックス。
- sortAscending: 列が昇順でソートされる場合はtrue、降順の場合はfalse。
- onSelectAll: すべての行の選択状態を切り替えるためのコールバック。
- dataRowHeight: 各行の高さ。
- dataTextStyle: テーブルのテキストデータのスタイル。
- headingRowHeight: ヘッダー行の高さ。
- headingTextStyle: ヘッダーのテキストスタイル。
- horizontalMargin: 各セルの水平方向のマージン。
- columnSpacing: 列間のスペース。
- showCheckboxColumn: 最初の列にチェックボックスを表示するかどうか。
- dividerThickness: 行間の分割線の厚さ。

```dart
DataTable(
  columns: const [
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Age')),
    DataColumn(label: Text('Role')),
  ],
  rows: const [
    DataRow(cells: [
      DataCell(Text('Alice')),
      DataCell(Text('24')),
      DataCell(Text('Engineer')),
    ]),
    DataRow(cells: [
      DataCell(Text('Bob')),
      DataCell(Text('27')),
      DataCell(Text('Designer')),
    ]),
    // ... 他の行
  ],
)
```
## Image
https://api.flutter.dev/flutter/widgets/Image-class.html

FlutterのMaterialウィジェットであるImageは、画像を表示するウィジェットです。インターネット、ローカルファイル、アセットなど、さまざまなソースから画像を表示できます。

Imageウィジェットは以下のパラメーターを持ちます。

- image: 画像のソース。URL、ファイルパス、アセット名のいずれかを指定できます。
- width: 画像の幅。
- height: 画像の高さ。
- fit: 画像をウィジェットのサイズに合わせてどのようにリサイズするか。
- alignment: 画像をウィジェット内でどのように配置するか。
- repeat: 画像を繰り返し表示するかどうか。
- color: 画像が見つからなかった場合に使用する色。
- cache: 画像をキャッシュするかどうか。
- semanticLabel: 画像の意味的なラベル。

```dart
Image(
  image: NetworkImage('https://example.com/image.png'),
  width: 100,
  height: 100,
)
```


## Icon
https://api.flutter.dev/flutter/widgets/Icon-class.html

Iconウィジェットは、Material Designのアイコンを表示するウィジェットです。Material Designのライブラリから、またはカスタムアイコンからアイコンを表示できます。

- icon: 表示するアイコン。これは、Material Designライブラリからの名前、またはカスタムアイコンのいずれかです。
- size: アイコンのサイズ。
- color: アイコンの色。
- semanticLabel: アイコンの意味的なラベル。

```dart
Icon(
  icon: Icons.home,
  size: 20.0,
  color: Colors.blue,
)
```

## Chip

https://api.flutter.dev/flutter/material/Chip-class.html

Chipウィジェットは、Material Designのチップを表示するウィジェットです。チップは、テキスト、アイコン、または両方を含む小さな矩形の領域です。チップは、オプション、タグ、またはその他の関連する情報のグループを表すために使用されます。

Chipウィジェットには、以下のパラメーターがあります。

avatar: チップの左側に表示するアバター。
backgroundColor: チップの背景色。
label: チップのラベル。
labelStyle: チップのラベルのスタイル。
deleteIcon: チップを削除するアイコン。
deleteIconColor: チップを削除するアイコンの色。
shape: チップの形状。
padding: チップの内側の余白。
margin: チップの外側の余白。
onDeleted: チップが削除されたときに呼び出されるコールバック。

```dart
Chip(
  avatar: Icon(Icons.person),
  label: Text('John Doe'),
  backgroundColor: Colors.blue,
)
```
## Divider
https://api.flutter.dev/flutter/material/Divider-class.html

Dividerウィジェットは、Material Designの水平または垂直の線を表示するウィジェットです。これは、リストやウィジェットのグループを区切るために使用されます。

Dividerウィジェットには、以下のパラメーターがあります。

- height: 線の高さ。
- width: 線の幅。
- color: 線の色。
- thickness: 線の太さ。
- indent: 線の左端から余白を追加します。
- endIndent: 線の右端から余白を追加します。
- orientation: 線の方向。
- context: ウィジェットが配置されているコンテキスト。

```dart
Divider(
  height: 10.0,
  color: Colors.black,
)
```
## ProgressIndicator
https://api.flutter.dev/flutter/material/ProgressIndicator-class.html

ProgressIndicatorは、Material Designの円形の進行状況インジケーターを表示するウィジェットです。これは、タスクが実行中であることをユーザーに示すために使用されます。

ProgressIndicatorウィジェットには、以下のパラメーターがあります。

- value: 進行状況の値。0から1の範囲で指定します。
- valueColor: 進行状況の色。
- backgroundColor: 背景色。
- strokeWidth: 線の太さ。
- semanticLabel: インジケーターの意味的なラベル。

```dart
ProgressIndicator(
  value: 0.5,
  valueColor: Colors.red,
  backgroundColor: Colors.grey,
  strokeWidth: 4.0,
)
```

## CircularProgressIndicator
https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html

CircularProgressIndicatorは、ProgressIndicatorの一種で、円形の進行状況インジケーターを表示します。これは、ProgressIndicatorよりも丸みを帯びた外観をしています。

パラメーター

CircularProgressIndicatorウィジェットには、ProgressIndicatorウィジェットと同じパラメーターがあります。

```dart
CircularProgressIndicator(
  value: 0.5,
  valueColor: Colors.red,
  backgroundColor: Colors.grey,
  strokeWidth: 4.0,
)
```


## TextFormField
https://api.flutter.dev/flutter/material/TextFormField-class.html
https://api.flutter.dev/flutter/material/TextField-class.html

TextFormFieldクラスは、Material Designのテキスト入力ウィジェットです。ユーザーの入力を収集するために使用されます。TextFieldクラスのサブクラスであり、検証や装飾などの追加機能を備えています。
似たウィジェットにTextFieldウィジェットがありますが、扱いやすさを考慮してTextFormFieldウィジェットを用いることを推奨します。

TextFormFieldクラスのパラメーターは、以下のとおりです。
- controller: テキストフィールドのテキストを管理するTextEditingController。
- decoration: テキストフィールドの装飾を指定するためのInputDecorationオブジェクト。
- validator: テキストフィールドのテキストを検証する関数。
- onSaved: テキストフィールドのテキストが保存されたときに呼び出される関数。

```dart
TextFormField(
  controller: myController,
  decoration: InputDecoration(
    labelText: 'ユーザー名',
    hintText: 'ユーザー名を入力してください',
  ),
  validator: (value) {
    if (value.isEmpty) {
      return 'ユーザー名を入力してください。';
    }
    return null;
  },
  onSaved: (value) {
    // ユーザー名をユーザープロファイルに保存します。
  },
)
```


## SelectableText
https://api.flutter.dev/flutter/material/SelectableText-class.html

SelectableTextクラスは、テキストを表示するウィジェットです。通常のTextクラスと異なり、テキストを自由に選択することができます。

SelectableTextクラスのパラメーターは、以下のとおりです。

- data: 表示するテキスト。
- style: テキストのスタイル。
- textAlign: テキストの水平方向の配置。
- softWrap: テキストの折り返し。
- overflow: テキストのオーバーフロー。
- textScaleFactor: テキストのスケールファクター。
- maxLines: テキストの最大行数。
- selectionColor: 選択されたテキストの色。


```dart
SelectableText(
  data: 'This is selectable text.',
  style: TextStyle(fontSize: 20.0),
  textAlign: TextAlign.center,
  softWrap: true,
  overflow: TextOverflow.ellipsis,
  textScaleFactor: 1.5,
  maxLines: 2,
  selectionColor: Colors.red,
)
```

## RichText
https://api.flutter.dev/flutter/widgets/RichText-class.html

RichTextクラスは、テキストを表示するウィジェットです。通常のTextクラスと異なり、テキストのスタイルや色などを、任意の位置で指定することができます。

RichTextクラスのパラメーターは、以下のとおりです。

- text: 表示するテキスト。
- textAlign: テキストの水平方向の配置。
- softWrap: テキストの折り返し。
- overflow: テキストのオーバーフロー。
- textScaleFactor: テキストのスケールファクター。
- maxLines: テキストの最大行数。
- children: テキストのスタイルや色などを指定する、TextSpanオブジェクトのリスト。

```dart
RichText(
  text: 'This is a RichText example.',
  textAlign: TextAlign.center,
  softWrap: true,
  overflow: TextOverflow.ellipsis,
  textScaleFactor: 1.5,
  maxLines: 2,
  children: [
    TextSpan(
      text: 'This is ',
      style: TextStyle(color: Colors.blue),
    ),
    TextSpan(
      text: 'RichText',
      style: TextStyle(color: Colors.red),
    ),
    TextSpan(
      text: ' example.',
      style: TextStyle(color: Colors.blue),
    ),
  ],
)
```

## InkWell
https://api.flutter.dev/flutter/material/InkWell-class.html

InkWellクラスは、タップや長押しなどのイベントを検出できるウィジェットです。タップや長押しなどのイベントが発生すると、インクを広げるアニメーションを表示します。

InkWellクラスのパラメーターは、以下のとおりです。

- child: タップや長押しなどのイベントが発生したときに表示するウィジェット。
- onTap: タップイベントが発生したときに呼び出される関数。
- onLongPress: 長押しイベントが発生したときに呼び出される関数。
- splashColor: インクアニメーションの色。
- splashRadius: インクアニメーションの半径。
- borderRadius: インクアニメーションの角の丸み。

```dart
InkWell(
  child: Text('This is an InkWell'),
  onTap: () {
    // タップイベントが発生したときに実行される処理
    print('InkWell was tapped.');
  },
)
```
## GestureDetector
https://api.flutter.dev/flutter/widgets/GestureDetector-class.html

GestureDetectorクラスは、タップやドラッグ、ピンチなどのジェスチャを検出できるウィジェットです。ジェスチャが発生したときに、指定した関数を呼び出します。

GestureDetectorクラスのパラメーターは、以下のとおりです。

- child: ジェスチャが発生したときに表示するウィジェット。
- onTap: タップイベントが発生したときに呼び出される関数。
- onTapDown: タップイベントが開始したときに呼び出される関数。
- onTapUp: タップイベントが終了したときに呼び出される関数。
- onTapCancel: タップイベントがキャンセルされたときに呼び出される関数。
- onDoubleTap: ダブルタップイベントが発生したときに呼び出される関数。
- onLongPress: 長押しイベントが発生したときに呼び出される関数。
- onPanStart: パンイベントが開始したときに呼び出される関数。
- onPanUpdate: パンイベントが更新されたときに呼び出される関数。
- onPanEnd: パンイベントが終了したときに呼び出される関数。
- onPanCancel: パンイベントがキャンセルされたときに呼び出される関数。
- onScaleStart: ピンチイベントが開始したときに呼び出される関数。
- onScaleUpdate: ピンチイベントが更新されたときに呼び出される関数。
- onScaleEnd: ピンチイベントが終了したときに呼び出される関数。
- onScaleCancel: ピンチイベントがキャンセルされたときに呼び出される関数。

```dart
GestureDetector(
  child: Text('This is a GestureDetector'),
  onTap: () {
    // タップイベントが発生したときに実行される処理
    print('GestureDetector was tapped.');
  },
)
```
## FutureBuilder
https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html

FutureBuilderクラスは、Futureオブジェクトの状態を監視するウィジェットです。Futureオブジェクトの状態が変化すると、ウィジェットを再ビルドします。

FutureBuilderクラスのパラメーターは、以下のとおりです。

- future: 監視するFutureオブジェクト。
- builder: Futureオブジェクトの状態に応じて、ウィジェットを生成する関数。
- initialData: Futureオブジェクトが完了する前に、表示するウィジェット。
- futureBuilderState: Futureオブジェクトの状態を示す値。

```dart
FutureBuilder(
    future: Future.delayed(Duration(seconds: 3)),
    builder: (context, snapshot) {
        // snapshot.hasData: Futureオブジェクトが完了しているかどうか。
        // snapshot.data: Futureオブジェクトの完了値。
        // snapshot.error: Futureオブジェクトでエラーが発生したかどうか。
        // snapshot.stackTrace: Futureオブジェクトでエラーが発生した場合のエラースタック。

        if (snapshot.hasData) {
          return Text(snapshot.data);
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return CircularProgressIndicator();
        }
    },
)
```
## StreamBuilder
https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html

StreamBuilderクラスは、Streamオブジェクトの状態を監視するウィジェットです。Streamオブジェクトの状態が変化すると、ウィジェットを再ビルドします。

StreamBuilderクラスのパラメーターは、以下のとおりです。

- stream: 監視するStreamオブジェクト。
- builder: Streamオブジェクトの状態に応じて、ウィジェットを生成する関数。
- initialData: Streamオブジェクトが完了する前に、表示するウィジェット。
- streamBuilderState: Streamオブジェクトの状態を示す値。

```dart
StreamBuilder(
    stream: Stream.fromIterable([1, 2, 3, 4, 5]),
    builder: (context, snapshot) {
        // snapshot.hasData: Streamオブジェクトにデータが存在するかどうか。
        // snapshot.data: Streamオブジェクトのデータ。
        // snapshot.error: Streamオブジェクトでエラーが発生したかどうか。
        // snapshot.stackTrace: Streamオブジェクトでエラーが発生した場合のエラースタック。

        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else {
          return CircularProgressIndicator();
        }
    },
)
```
## AnimatedContainer
https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html

```dart
```
## Hero
https://api.flutter.dev/flutter/widgets/Hero-class.html
```dart
```
## Transform
https://api.flutter.dev/flutter/widgets/Transform-class.html

```dart
```
## Wrap
https://api.flutter.dev/flutter/widgets/Wrap-class.html
```dart
```
## Align
https://api.flutter.dev/flutter/widgets/Align-class.html

```dart
```

## Expanded
https://api.flutter.dev/flutter/widgets/Expanded-class.html

```dart
```

## AspectRatio
https://api.flutter.dev/flutter/widgets/AspectRatio-class.html

```dart
```
## InheritedWidget
https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html

```dart
```
## CustomScrollView
https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html

```dart
```
## SliverAppBar
https://api.flutter.dev/flutter/material/SliverAppBar-class.html

```dart
```
## SliverList
https://api.flutter.dev/flutter/widgets/SliverList-class.html

```dart
```
## SliverGrid
https://api.flutter.dev/flutter/widgets/SliverGrid-class.html

```dart
```
## SliverFixedExtentList
https://api.flutter.dev/flutter/widgets/SliverFixedExtentList-class.html

```dart
```
## SliverToBoxAdapter
https://api.flutter.dev/flutter/widgets/SliverToBoxAdapter-class.html

```dart
```
## SliverPadding
https://api.flutter.dev/flutter/widgets/SliverPadding-class.html

```dart
```
## SliverFillViewport
https://api.flutter.dev/flutter/widgets/SliverFillViewport-class.html

```dart
```
## SliverFillRemaining
https://api.flutter.dev/flutter/widgets/SliverFillRemaining-class.html

```dart
```
## SliverAnimatedList
https://api.flutter.dev/flutter/widgets/SliverAnimatedList-class.html

```dart
```


以上です！
まだまだFlutter系ウィジェットはたくさんあるので気になった方は調べてみてください！

# おまけ IDEの便利なショートカット
Flutterのウィジェット（クラス）をそのまま書いていくと大変です。
AndroidStudioやVSCodeでFlutterのプラグインを導入していればショートカットで簡単にウィジェットの生成ができます。いくつか紹介するので覚えて有効利用してください。

ちなみに、私はFlutter開発の際以下の画像のようにシミュレーターとIDEを画面分割して用いています

![](https://storage.googleapis.com/zenn-user-upload/75eabe145b09-20230810.png =600x)

### Stateless/Stateful ウィジェットの生成
`StatelessWidget`の場合は`stl`, `StatefulWidgetの場合は`stf`と入力すれば以下のような候補が出ます。（AndroidStudio, VS Code共通です）

![](https://storage.googleapis.com/zenn-user-upload/1d46aaab76ff-20230810.png =600x)

その次に、stlessやstfulなどの候補を選ぶと以下のように土台が一括出力されます

![](https://storage.googleapis.com/zenn-user-upload/bd5d0dbcbf68-20230810.png =600x)

最初は`MyHome`となっていますが、そのまま`HomePage`など入力するとクラス名も指定できます

![](https://storage.googleapis.com/zenn-user-upload/287e0b4c4897-20230810.png =600x)

#### gifで確認

![](https://storage.googleapis.com/zenn-user-upload/5aa49cfec28b-20230810.gif =600x)

### Stateless -> Statefulの変換
最初はウィジェットを組むだけでしたが、後からStateの管理をしたくなった場合はStatefulウィジェットに切り替える必要があります。
そうしたい場合、`StatelessWidget`にフォーカスした状態で同じコマンドを実行してください。そうすると以下のように出るため`Convert to StatefulWidget`を選択してください。

![](https://storage.googleapis.com/zenn-user-upload/bb7e18aca0da-20230810.png)


### ウィジェットでラップする
IDEやOSで異なりますが、ラップしたいクラスにフォーカスしている状態で以下のキーを押下してください。
今回は、Container()にフォーカスしてから実行しましょう

:::message
「Container」の文字列のどこかにフォーカスするようにしてください。
:::

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(); // ここにフォーカス
  }
}
```

- AndroidStudio
	- Windows -> Alt + Enter
	- Mac -> Option + Enter

- VS Code
	- Widows -> Windows + ピリオド
	- Mac -> Command + ピリオド

キーを押すと、以下のように候補が出ます。

![](https://storage.googleapis.com/zenn-user-upload/174d52b26787-20230810.png w=600x)

例えば`Wrap with Center`を選択すると以下のようになります。

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container()); // Centerで囲われた
  }
}
```

### ウィジェットの親子関係を入れ替える
例えば、下記のコードのSizedBoxとElevatedButtonを入れ替えたい場合も同じショートカットで実施できます。
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('サンプル'),
        ),
      ),
    );
  }
}
```

![](https://storage.googleapis.com/zenn-user-upload/486a75af2e53-20230810.png)

`ElebatedButton`にフォーカスして実行すれば`Swap with parent`、`SizedBox`にフォーカスして実行すれば`Swap with child`と出るので選択すれば`SizedBox`と`ElevatedButton`の親子関係が入れ替わります。

また、すべてのウィジェットが候補として出てくるわけではありません。候補がない場合は、一番上に出てくる`Wrap with widget...`を選択してからウィジェット名を手動で記載すればラップ可能です。


### 不要なウィジェットの削除
以下のコードから、SizedBoxを消したいとします。その場合、SizedBoxにフォーカスして同じショートカットを実行してください。そうすると、`Remove this Widget`が出てくるので選択してください。
そうすれば、`SizedBox`は`height`や`width`のようなパラメーターを含め丸ごと削除されます

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('サンプル'),
        ),
      ),
    );
  }
}
```

### ウィジェットをコンポーネント化
ウィジェットを重ねて行くうちに、コードが肥大化した場合、特定部分をウィジェットとして切り出すことをお勧めします。コマンドは上記同様で、選択肢は`Extract Widget`を選択してください。
動作については以下のgifを確認してください。

![](https://storage.googleapis.com/zenn-user-upload/fbe89b43597b-20230810.gif)