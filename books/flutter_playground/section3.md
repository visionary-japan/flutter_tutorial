---
title: "アプリのテーマ設定"
---

Flutterでは、共通なデザインを構築するために幾つかの手段があります。
セクション1でも少しだけ触れましたが、アプリの基本設定となるMaterialAppでテーマ設定をする手段と、共通パーツを作るというやり方をそれぞれ学習しましょう。

コンポーネントの共通化を早めにすることで、共通したデザインを実装できるため開発しやすくなると思います。

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
`textTheme: テキストのテーマ性。
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

