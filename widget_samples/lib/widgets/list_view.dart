import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ListViewSample extends StatelessWidget {
  const ListViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'ListView Sample',
      child: SizedBox(
          child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          // ユーザーの単体データ
          final User user = userList[index];
          return Container(
            height: 80,
            color: Colors.blue,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.name),
                const SizedBox(width: 10),
                Text(user.age.toString()),
              ],
            ),
          );
        },
      )
          // child: ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          // Container(
          //   height: 150,
          //   width: 150,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 10,
          //     horizontal: 10,
          //   ),
          //       color: Colors.red,
          //       child: const Center(child: Text('a')),
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       margin: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 10,
          //       ),
          //       color: Colors.red,
          //       child: const Center(child: Text('a')),
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       margin: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 10,
          //       ),
          //       color: Colors.red,
          //       child: const Center(child: Text('a')),
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       margin: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 10,
          //       ),
          //       color: Colors.red,
          //       child: const Center(child: Text('a')),
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       margin: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 10,
          //       ),
          //       color: Colors.red,
          //       child: const Center(child: Text('a')),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

const List<User> userList = [
  User(name: 'John', age: 12),
  User(name: 'Jane', age: 13),
  User(name: 'Jack', age: 14),
  User(name: 'Jill', age: 15),
  User(name: 'James', age: 16),
];

// オブジェクト（モデルクラス）
class User {
  const User({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;
}
