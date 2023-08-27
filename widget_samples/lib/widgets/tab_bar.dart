import 'package:flutter/material.dart';

class TabBarSample extends StatelessWidget {
  const TabBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // タブの数
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.business), text: 'Business'),
              Tab(icon: Icon(Icons.school), text: 'School'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab')),
            Center(child: Text('Business Tab')),
            Center(child: Text('School Tab')),
          ],
        ),
      ),
    );
  }
}
