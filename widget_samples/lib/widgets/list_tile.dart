import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ListTileSample extends StatelessWidget {
  const ListTileSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'ListTile Widget',
      child: ListTile(
        tileColor: Colors.lightBlueAccent, // 背景色
        leading: const Icon(Icons.star),
        title: const Text('タイトル'),
        subtitle: const Text('サブタイトル'),
        trailing: const Icon(Icons.arrow_forward),
        isThreeLine: false,
        dense: false,
        enabled: true,
        onTap: () {
          // タップ時の処理
          debugPrint('タップされました');
        },
        onLongPress: () {
          // 長押し時の処理
          debugPrint('長押しされました');
        },
      ),
    );
  }
}
