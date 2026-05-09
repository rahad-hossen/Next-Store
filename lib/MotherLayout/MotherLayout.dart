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

  List<Widget> BottomManu = [
    Home(),
    Invertoryscreen(),
    AnalysicsScreen(),
    ProfileScreen()
  ];
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomManu[current_index],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
          currentIndex: current_index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index){
            setState(() {
              current_index = index;
            });

          },
          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:  ""

            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.inventory),
                label:  ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label:  ""
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label:  ""
            )
          ]
      ),
    );
  }
}
