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
