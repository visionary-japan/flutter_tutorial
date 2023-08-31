import 'package:flutter/material.dart';
import 'package:widget_samples/component/base_scaffold.dart';

class ImageSample extends StatelessWidget {
  const ImageSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: 'Image Sample',
      child: Center(
        child: Image(
          image: NetworkImage('https://picsum.photos/id/237/500/500'),
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
