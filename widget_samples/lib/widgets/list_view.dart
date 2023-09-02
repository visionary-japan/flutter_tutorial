import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ListViewSample extends StatelessWidget {
  const ListViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'ListView Sample',
      child: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              color: Colors.red,
              child: const Center(child: Text('a')),
            ),
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              color: Colors.red,
              child: const Center(child: Text('a')),
            ),
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              color: Colors.red,
              child: const Center(child: Text('a')),
            ),
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              color: Colors.red,
              child: const Center(child: Text('a')),
            ),
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              color: Colors.red,
              child: const Center(child: Text('a')),
            ),
          ],
        ),
      ),
    );
  }
}
