import 'package:flavor_hub/constants/colors.dart';
import 'package:flutter/material.dart';

import '../screens/main_screens/favourites.dart';
import '../screens/main_screens/home_screen.dart';
import '../screens/main_screens/notifications.dart';
import '../screens/main_screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myIndex = 0;

  List<Widget> screensList = [
    HomeScreen(),
    Notifications(),
    Favourites(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.lightText2,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]),
    );
  }
}
