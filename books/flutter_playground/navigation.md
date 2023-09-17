---
title: "画面遷移 Navigator / go_router"
---

# 画面遷移の基本 Navigator

Webサイトで画面を跨ぐ際は、別のURLに遷移し、ブラウザはある程度その履歴を記憶しているため前に進んだり戻ったりすることができます。
それに対し、スマホアプリでは画面の重なりで遷移をします。
次の画面に遷移、つまり新しい画面を上に重ねることを`push`といいます。
それに対し、一番新しい画面を取り除いて前の画面に戻ることを`pop`といいます。

Flutterでは、画面遷移は`Navigator`を用いて画面遷移をします。

https://api.flutter.dev/flutter/widgets/Navigator-class.html

先ほどの、`push`と`pop`をイラストで確認しましょう

### 初期状態

![](https://storage.googleapis.com/zenn-user-upload/618f4d8121a4-20230901.png)

### push

pushを用いて画面遷移をした場合、このように新しい画面が上に重なります。

:::details Navigator.pushのサンプル
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // pushで遷移する
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NextPage()));
          },
          child: Text('次へ'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      body: Center(
        child: Text('次ページ'),
      ),
    );
  }
}
```
:::

![](https://storage.googleapis.com/zenn-user-upload/6f2b48aea482-20230901.png)


### pop

popで戻った場合、一番上の画面が取れて元の画面が表示されます

:::details Navigator.popのサンプル
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // popで戻る
            Navigator.pop(context);
          },
          child: Text('戻る'),
        ),
      ),
    );
  }
}

```
:::

![](https://storage.googleapis.com/zenn-user-upload/3ea8ebc62aaf-20230901.png)


### pushReplacement
そのほかにも、現在一番上の画面を差し替える`pushReplacement`というメソッドもあります。

:::details Navigator.pushReplacementのサンプル
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // replaceで遷移する
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NextPage()));
          },
          child: Text('次へ'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      body: Center(
        child: Text('次ページ'),
      ),
    );
  }
}
```
:::

### pushNamed
よく、フレームワークでルーティングを用いる場合、直接URLや画面を指定する方法もありますが、`name`というラベルを指定して遷移する方法もあります。

:::details Navigator.pushNamed　のサンプル
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator Sample',
      routes: {
        '/home': (context) => HomePage(),
        '/next': (context) => NextPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // '/next'に遷移
                Navigator.of(context).pushNamed('/next');
              },
              child: Text('次へ'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      body: Center(
        child: Text('次ページ'),
      ),
    );
  }
}
```
:::


# GoRouter

Flutterでは、公式が画面遷移のパッケージとして`go_router`を推奨しています。
go_routerパッケージは、Webアプリのルーティング定義のように扱うことができます。

#### パッケージ

https://pub.dev/packages/go_router

#### ドキュメント

https://docs.page/csells/go_router

https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html

https://github.com/csells/go_router/blame/main/docs/ja/index.mdx

## 基本的な書き方

まずは、`go_router`の基本的な書き方を確認してみましょう！

`go_router`のイメージとして、あらかじめ`path`, `name`, `builder`（画面）を階層構造に定義することができます。

![](https://storage.googleapis.com/zenn-user-upload/263a7c67fcd9-20230901.png =600x)


```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: 動作確認をするにはmain.dartを以下のように書き換えてください
final router = GoRouter(
  // 大元のrouterは`GoRouter`クラス
  debugLogDiagnostics: true,
  initialLocation: HomePage.routePath,
  routes: [
    // 各ページは`GoRoute`クラス
    GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
      routes: [
        GoRoute(
          path: PageA.routePath,
          name: PageA.routeName,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PageA(),
          ),
          routes: [
            GoRoute(
              path: PageA1.routePath,
              name: PageA1.routeName,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const PageA1(),
              ),
            ),
            GoRoute(
              path: PageA2.routePath,
              name: PageA2.routeName,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const PageA2(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() {
  runApp(
    MaterialApp(
      title: 'Widget Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // ルーティングの反映をするので.routerをつける
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        fontFamily: 'LINE_Seed_JP',
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      /// go_routerの設定
      // ルート情報の解析
      routeInformationParser: router.routeInformationParser,
      // ルート情報の管理
      routerDelegate: router.routerDelegate,
      // ルート情報の提供
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routePath = '/';
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Home',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go To Page A'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  static const routePath = 'page-a';
  static const routeName = 'page-a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Home',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageA1.routeName);
              },
              child: const Text('Go To Page A-1'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageA2.routeName);
              },
              child: const Text('Go To Page A-2'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA1 extends StatelessWidget {
  const PageA1({super.key});

  static const routePath = 'page-a1';
  static const routeName = 'page-a1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageA1'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'PageA1',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
                // 以下のようにも書ける
                // GoRouter.of(context).pop();
              },
              child: const Text('Back To Page A'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA2 extends StatelessWidget {
  const PageA2({super.key});

  static const routePath = 'page-a2';
  static const routeName = 'page-a2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageA2'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'PageA2',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
                // 以下のようにも書ける
                // GoRouter.of(context).pop();
              },
              child: const Text('Back To Page A'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 上記のコードのコーディングの手順
go_routerによるルーティングを定義するには、以下のような流れで実装するとやりやすいと思います。

1. ホームの画面を実装
2. 遷移先用のサンプル画面の実装
3. `final router = GoRouter(...)`のように変数定義をする。
4. `GoRouter`の`initialRoute`と`routes`にホーム画面の定義をする
5. MaterialAppに設定をする
6. 他の画面を追加する

実際に、やっていきましょう。

### 0. 初期状態
まずは、`main`関数から初期画面までを実装します。

:::details 初期状態のコード
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: NavigatorSample(),
    ),
  );
}

class NavigatorSample extends StatelessWidget {
  const NavigatorSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigatorサンプル'),
      ),
    );
  }
}

```
:::

### 1. ホーム画面を実装
次に、仮のホーム画面を実装します。

:::details ホーム画面を実装
```dart: main.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('ボタン'),
        ),
      ),
    );
  }
}
```
:::

### 2. 遷移先画面の実装
次に、サンプルで遷移する先の画面を実装しましょう。

:::details 遷移先画面の定義
```dart: sample.dart
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('ボタン'),
        ),
      ),
    );
  }
}
```
:::

### 3. router変数の定義
各画面ができたため、画面のURLを定義したルーティングを実装しましょう。

:::details router変数の定義
```dart: router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'sample_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // アニメーションを実装したい場合などは、pageBuilderを使う
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(
        child: HomePage(),
      ),
    ),
    // サンプル画面
    GoRoute(
      path: '/sample',
      pageBuilder: (context, state) => const MaterialPage(
        child: SamplePage(),
      ),
    ),
  ],
);
```
:::

### 4. GoRouterの初期パラメーターの設定
先ほどルーティングを定義した`router`変数に、追加でパラメーターの設定をしてみましょう。
複雑なセクションは後半で実施しますが、定番の以下の2つのパラメーターを追加しましょう。
- `initialLocation`: 初期URL
- `debugLogDiagnostics`: デバッグログを表示するか

:::details GoRouterクラスの設定
```diff dart: router.dart
final GoRouter router = GoRouter(
+   initialLocation: '/', // 初期表示画面
+   debugLogDiagnostics: true, // デバッグログの有効化
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // アニメーションを実装したい場合などは、pageBuilderを使う
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(
        child: HomePage(),
      ),
    ),
    // サンプル画面
    GoRoute(
      path: '/sample',
      pageBuilder: (context, state) => const MaterialPage(
        child: SamplePage(),
      ),
    ),
  ],
);
```
:::

### 5. MaterialAppクラスへの適応
先ほどの`router`変数で定義したものは、`MaterialApp`クラスに適応することでプロジェクトに`go_router`を設定することができます。

:::details MaterialAppへの適応
```diff dart: router.dart
import 'package:flutter/material.dart';

import '../router/router.dart';

void main() {
  runApp(
 -    MaterialApp(
 +    MaterialApp.router(
 -      home: const NavigatorSample(),
 +      routeInformationParser: router.routeInformationParser,
 +      routerDelegate: router.routerDelegate,
 +      routeInformationProvider: router.routeInformationProvider,
    ),
  );
}
```
:::

### 6. 他の画面遷移の設定を追加
それぞれ画面遷移するために、遷移ロジックを含んだボタンを実装していきます。
:::details NavigatorSample
```diff dart: main.dart
class NavigatorSample extends StatelessWidget {
  const NavigatorSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigatorサンプル'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
+             context.push('/home');
          },
          child: const Text('Home Pageへ遷移'),
        ),
      ),
    );
  }
}
```
:::

:::details HomePage
```diff dart: home_page.dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
+             context.push('/sample');
          },
          child: const Text('Sample Pageへ遷移'),
        ),
      ),
    );
  }
}
```
:::


:::details SamplePage
```diff dart: sample_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
+             context.go('/');
          },
          child: const Text('ボタン'),
        ),
      ),
    );
  }
}
```
:::
## 完成系
コードベースの説明になってしまいましたが、1~6を整理すると以下のようになります。

TODO: gitリンク記載

## 基本のメソッド

https://pub.dev/documentation/go_router/latest/go_router/GoRouterHelper.html

`go_router`にも、`Navigator`同様に標準のヘルパー関数があります。
知っておきたいものを紹介していくので、動かしながら確認してみましょう。
先ほどの完成系のコードをいじりながら動作確認していきます。

## 細かいルーティング処理
- パラメーター
- リダイレクト
- 履歴
- ボトムナビゲーション
- エラー画面
