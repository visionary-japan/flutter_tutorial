---
title: "アプリのテーマ設定"
---

Flutterでは、共通なデザインを構築するための手段が2つあります。
1つ目はセクション1でも少しだけ触れましたが、アプリの基本設定となるMaterialAppでテーマ設定をする手段です。2つ目は共通パーツを作って使い回すやり方です。
それぞれ学習していきましょう。

また、スタイルについては共通化を早めにすることで短期間で開発できるようになります。
ただし、デザインが不確定な段階から共通化を狙いすぎると手戻りが発生して大変なのでデザインの納品具合を見て検討してください。

# Themeで共通設定をする

Flutterアプリでは、以下のようにテーマ（`Theme`）を設定したMaterialAppをreturnしているWidgetクラスの指定が必須となっております。
```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// Scaffoldの背景色（厳密にはbackgroundColorと異なる）
        canvasColor: Colors.white,

        /// 基本の色設定
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 36, 50, 255),
          // 略
        ),

        /// フォントファミリーの設定
        fontFamily: 'NotoSansJP',

        /// テキストのスタイル設定
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          // 略
        ),

        /// ElevatedButtonのデザイン
        elevatedButtonTheme: ElevatedButtonThemeData(
          // 略
        ),

        /// OutlinedButtonのデザイン
        outlinedButtonTheme: OutlinedButtonThemeData(
          // 略
        ),

        /// TextButtonのデザイン
        textButtonTheme: TextButtonThemeData(
          // 略
        ),

        /// IconButtonのデザイン
        iconButtonTheme: IconButtonThemeData(
          // 略
        ),

        /// マテリアル3を有効にする
        useMaterial3: true,

        /// platformの指定
        platform: TargetPlatform.iOS,
      ),

      /// ダークテーマの設定
      darkTheme: ThemeData(
          // lightThemeと同じ設定ができる
          ),

      /// ロケールの設定
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],

      /// ホーム画面の設定
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

いくつかサンプルを追加してある通りですが、`MaterialApp`クラスの`theme`パラメーターに様々なスタイルの設定をすることが可能です。そうすることで、都度画面単位でスタイルの設定をしなくて済む上、スタイルの一元管理もできるので共通化したい場合は有効な手段です。
以下は、`ThemeData`に指定できるパラメーター（抜粋）です。
しかし、Flutterのアプデに伴い使用できなくなる場合もあるのでお気をつけください。

### 色関連
`primaryColor`: アプリの主要部分の背景色。
`accentColor`: アクセントカラー。
`canvasColor`: キャンバスのデフォルトの色。
`backgroundColor`: 背景色。
`errorColor`: エラー表示に使用される色。
`buttonColor`: ボタンの色。

### テーマデータ
`textTheme`: テキストのテーマ性。
- `headline1`: 最も大きな見出し。
- `headline2`: 2番目に大きな見出し。
- `headline3`: 3番目に大きな見出し。
- `headline4`: 4番目に大きな見出し。
- `headline5`: 5番目に大きな見出し。
- `headline6`: 6番目に大きな見出し。
- `subtitle1`: サブタイトル。
- `subtitle2`: 2番目のサブタイトル。
- `bodyText1`: 本文。
- `bodyText2`: 2番目の本文。
- `caption`: キャプション。
- `button`: ボタンのテキスト。
- `overline`: 上付き文字。
`iconTheme`: アイコンのテーマ性。
- `color`: アイコンの色。
- `opacity`: アイコンの不透明度。
- `size`: アイコンのサイズ。
`buttonTheme`: ボタンのテーマ性。
- `minWidth`: 最小幅。
- `height`: 高さ。
- `padding`: パディング。
- `shape`: 形状。
- `alignedDropdown`: ドロップダウンの位置合わせ。
- `buttonColor`: ボタンの色。
- `textTheme`: テキストテーマ。

### ウィジェットのカスタマイズ
`appBarTheme`: AppBarのカスタマイズ。
`bottomNavigationBarTheme`: BottomNavigationBarのカスタマイズ。
`cardTheme`: カードのカスタマイズ。
`dialogTheme`: ダイアログのカスタマイズ。

### その他の設定
`brightness`: テーマの明るさ（明るいまたは暗い）。
`platform`: ウィジェットが適応するべきプラットフォーム。

上記はあくまで抜粋です。詳細については、以下公式を確認してください。

https://api.flutter.dev/flutter/material/ThemeData-class.html


# Componentで共通パーツを作る

次に、共通Componentを実装して共通のスタイルを実装する手段について解説します。
まず、`lib`配下に`components`というフォルダを作成してください。
```zsh
cd lib
mkdir components
```

次に、作成した`components`配下に`text.dart`を作成しましょう。
```zsh
cd components
touch text.dart
```

もちろん手動で作成していただいても問題ありません。以下のようになっていれば大丈夫です。
![](https://storage.googleapis.com/zenn-user-upload/2d72f519fa97-20230815.png =400x)

次に、作成した`text.dart`を以下のように修正しましょう
```dart:text.dart
import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  const TextSmall(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}

class TextLarge extends StatelessWidget {
  const TextLarge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
```
`TextSmall`, `TextMedium`, `TextLarge`クラスをそれぞれ作成しました。
各クラスは、textというパラメーターを受け取るようにしているため、使用する際は標準の`Text`クラスと同様に使用できます。

### 使用例
```dart
// 通常
Text('メッセージ');
// 作成したcomponent
TextMedium('Mediumメッセージ');
```

# まとめ
FlutterでUIのスタイルを共通化するには
- themeDataで共通設定をする
- 共通のComponentを作成する

という2つの手段を紹介しました。
どちらも基礎的な部分だけ触れましたが、ぜひ参考にしてみてください。

---

このセクションのサンプルコードは以下のリポジトリを参照してください。

https://github.com/visionary-japan/flutter_theme_sample