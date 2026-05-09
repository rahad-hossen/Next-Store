import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextstore/Screens/HomeScreens/AnalysicsScreen.dart';
import 'package:nextstore/Screens/HomeScreens/HomeScreen.dart';
import 'package:nextstore/Screens/HomeScreens/Invertoryscreen.dart';
import 'package:nextstore/Screens/HomeScreens/ProfileScreen.dart';

class Motherlayout extends StatefulWidget {
  const Motherlayout({super.key});

  @override
  State<Motherlayout> createState() => _MotherlayoutState();
}

class _MotherlayoutState extends State<Motherlayout> {
  int _currentIndex = 0;


  final List<Widget> _bottomMenu = const [
    HomeScreen(),
    Invertoryscreen(),
    AnalysicsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _bottomMenu,
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          selectedItemColor: Colors.orange.shade800,
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: Colors.white,
          elevation: 0,

          iconSize: 28,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle_fill),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}