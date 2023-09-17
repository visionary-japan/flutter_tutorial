import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

/// Section5 画面遷移 Navigator / go_router 用のアプリケーションです。

void main() {
  runApp(
    MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/home');
          },
          child: const Text('Home Pageへ遷移'),
        ),
      ),
    );
  }
}
