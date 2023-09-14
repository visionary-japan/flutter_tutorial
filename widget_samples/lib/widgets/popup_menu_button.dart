import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

enum PopupMenuButtonSampleType {
  one,
  two,
  three,
}

class PopupMenuButtonSample extends StatefulWidget {
  const PopupMenuButtonSample({super.key});

  @override
  State<PopupMenuButtonSample> createState() => _PopupMenuButtonSampleState();
}

class _PopupMenuButtonSampleState extends State<PopupMenuButtonSample> {
  PopupMenuButtonSampleType _value = PopupMenuButtonSampleType.one;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'PopupMenuButton Sample',
      child: Center(
        child: PopupMenuButton<PopupMenuButtonSampleType>(
          icon: const Icon(Icons.settings),
          iconSize: 40,
          position: PopupMenuPosition.under,
          initialValue: PopupMenuButtonSampleType.one,
          itemBuilder: (BuildContext context) {
            return const <PopupMenuEntry<PopupMenuButtonSampleType>>[
              PopupMenuItem(
                value: PopupMenuButtonSampleType.one,
                child: Text('選択肢1'),
              ),
              PopupMenuItem(
                value: PopupMenuButtonSampleType.two,
                child: Text('選択肢2'),
              ),
              PopupMenuItem(
                value: PopupMenuButtonSampleType.three,
                child: Text('選択肢3'),
              ),
            ];
          },
          onSelected: (PopupMenuButtonSampleType value) {
            // ドロップダウンリストの値が変更されたときに実行される処理
            setState(() {
              _value = value;
            });
            // switchで分岐して処理を実行
            switch (value) {
              case PopupMenuButtonSampleType.one:
                // 選択肢1が選択されたときの処理
                break;
              case PopupMenuButtonSampleType.two:
                // 選択肢2が選択されたときの処理
                break;
              case PopupMenuButtonSampleType.three:
                // 選択肢3が選択されたときの処理
                break;
            }
          },
        ),
      ),
    );
  }
}
