import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';
import 'main.dart';
import 'sample_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/', // 初期表示画面
  debugLogDiagnostics: true, // デバッグログの有効化
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NavigatorSample(),
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
