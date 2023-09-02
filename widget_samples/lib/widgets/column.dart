import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ColumnSample extends StatelessWidget {
  const ColumnSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Column Sample',
      child: SizedBox(
        height: 500,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主軸方向の子ウィジェットの配置
          crossAxisAlignment: CrossAxisAlignment.center, // 交差軸方向の子ウィジェットの配置
          mainAxisSize: MainAxisSize.min, // 主軸のサイズを最小化
          verticalDirection: VerticalDirection.down, // 子ウィジェットの垂直方向の順序
          children: <Widget>[
            const Text('Hello, World!'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me'),
            ),
            const Text('Welcome to Flutter'),
          ],
        ),
      ),
    );
  }
}
