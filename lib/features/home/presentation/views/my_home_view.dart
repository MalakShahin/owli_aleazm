import 'package:flutter/material.dart';

import 'home_view.dart';
import 'khotab_view.dart';
import 'profile_view.dart';
import 'religious_books_view.dart';
import 'sebha_tab_view.dart';
import 'widgets/my_curved_navigation_bar.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  int selectedIndex = 0;
  final List<Widget> pages = const [
    HomeView(),
    KhotabView(),
    ReligiousBooksView(),
    SebhaTabView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyCurvedNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: pages[selectedIndex],
    );
  }
}
