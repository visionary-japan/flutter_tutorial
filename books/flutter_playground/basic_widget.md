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


`Center`
```dart
```

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

~ 画像 ~

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
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            // ボタンが押されたときに実行される処理
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
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

```dart
```
## TabBar
https://api.flutter.dev/flutter/material/TabBar-class.html

```dart
```
## Drawer
https://api.flutter.dev/flutter/material/Drawer-class.html

```dart
```
## Tooltip
https://api.flutter.dev/flutter/material/Tooltip-class.html

```dart
```
## Card
https://api.flutter.dev/flutter/material/Card-class.html

```dart
```
## DataTable
https://api.flutter.dev/flutter/material/DataTable-class.html

```dart
```
## Image
https://api.flutter.dev/flutter/widgets/Image-class.html

```dart
```
## Icon
https://api.flutter.dev/flutter/widgets/Icon-class.html

```dart
```
## Chip
https://api.flutter.dev/flutter/material/Chip-class.html

```dart
```
## Divider
https://api.flutter.dev/flutter/material/Divider-class.html

```dart
```
## ProgressIndicator/CircularProgressIndicator
https://api.flutter.dev/flutter/material/ProgressIndicator-class.html
https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html
```dart
```
## TextFormField
https://api.flutter.dev/flutter/material/TextFormField-class.html
https://api.flutter.dev/flutter/material/TextField-class.html

```dart
```
## SelectableText
https://api.flutter.dev/flutter/material/SelectableText-class.html

```dart
```
## RichText
https://api.flutter.dev/flutter/widgets/RichText-class.html

```dart
```
## InkWell
https://api.flutter.dev/flutter/material/InkWell-class.html

```dart
```
## GestureDetector
https://api.flutter.dev/flutter/widgets/GestureDetector-class.html

```dart
```
## FutureBuilder
https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
```dart
```
## StreamBuilder
https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html

```dart
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