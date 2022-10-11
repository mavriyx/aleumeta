import 'package:aleumeta/screens/homescreen.dart';
import 'package:aleumeta/screens/profilescreen.dart';
import 'package:aleumeta/screens/readscreen.dart';
import 'package:aleumeta/screens/searchscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Homescreen(),
    Readscreen(),
    Searchscreen(),
    Profilescreen()
  ];

  get scrollOffset => null;

  get bottomNavigationBar => null;

  get pageController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 17),
            child: GNav(
              gap: 8,
              tabBackgroundColor: Colors.grey.withOpacity(0.3),
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Басты бет',
                ),
                GButton(
                  icon: Icons.play_circle,
                  text: 'Оқу',
                ),
                GButton(
                  icon: Icons.search_rounded,
                  text: 'Іздеу',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Профиль',
                ),
              ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
            ),
          )
        ),
    );
  }
}







