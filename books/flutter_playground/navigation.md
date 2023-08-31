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

まずは、go_routerの基本的な書き方を確認してみましょう！

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
    return MaterialApp.router(
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



## 基本のメソッド

https://pub.dev/documentation/go_router/latest/go_router/GoRouterHelper.html

## 細かいルーティング処理
- パラメーター
- リダイレクト
- 履歴
- ボトムナビゲーション
- エラー画面
