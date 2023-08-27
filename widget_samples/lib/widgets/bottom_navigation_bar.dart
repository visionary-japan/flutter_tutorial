import 'package:flutter/material.dart';

class BottomNavigationBarSample extends StatelessWidget {
  const BottomNavigationBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Sample'),
      ),
      body: const Center(
        child: Text('Bottom Navigation Bar Sample'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inquiry',
          ),
        ],
        onTap: (index) {
          // タップされたアイテムのインデックスを処理
        },
        currentIndex: 2,
        elevation: 8.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 24.0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.red),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(color: Colors.red),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        mouseCursor: SystemMouseCursors.click,
        enableFeedback: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        useLegacyColorScheme: true,
      ),
    );
  }
}
