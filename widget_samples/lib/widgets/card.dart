import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class CardSample extends StatelessWidget {
  const CardSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Card Sample',
      child: Card(
        color: const Color.fromARGB(255, 142, 255, 191),
        shadowColor: Colors.grey,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        borderOnForeground: true,
        margin: const EdgeInsets.all(10.0),
        child: const ListTile(
          leading: Icon(Icons.album),
          title: Text('Album Title'),
          subtitle: Text('Description of the album.'),
        ),
      ),
    );
  }
}
