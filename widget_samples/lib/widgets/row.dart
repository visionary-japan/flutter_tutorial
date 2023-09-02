import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class RowSample extends StatelessWidget {
  const RowSample({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BaseScaffold(
      title: 'Row Sample',
      child: SizedBox(
        height: 500,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主軸方向の子ウィジェットの配置
          crossAxisAlignment: CrossAxisAlignment.center, // 交差軸方向の子ウィジェットの配置
          mainAxisSize: MainAxisSize.max, // 主軸のサイズを最大化
          verticalDirection: VerticalDirection.down, // 子ウィジェットの垂直方向の順序
          textDirection: TextDirection.ltr, // 子ウィジェットの水平方向のテキスト順序
          children: <Widget>[
            const Text('Hello,'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me'),
            ),
            const Text('World!'),
          ],
        ),
      ),
    );
  }
}
