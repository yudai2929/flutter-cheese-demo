import 'package:flutter/material.dart';

import 'home.dart';
import 'map.dart';
import 'my_page/screen.dart';
import 'route.dart';
import 'submit.dart';

class MainRouter extends StatefulWidget {
  const MainRouter({Key? key}) : super(key: key);

  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  static const _screens = [
    HomeScreen(),
    MapScreen(),
    SubmitScreen(),
    RouteScreen(),
    MyPageScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // TODO: ルーティング周りのリファクタリング
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_outlined), label: 'ホーム'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: 'マップ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: '投稿'),
            BottomNavigationBarItem(
                icon: Icon(Icons.density_medium), label: 'ルート'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: 'マイページ'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}