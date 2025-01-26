import 'package:flavor_hub/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/main_screens/discover.dart';
import '../screens/main_screens/favourites.dart';
import '../screens/main_screens/home_screen.dart';
import '../screens/main_screens/profile.dart';
import 'button_loader.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});

  final loadData = Get.arguments;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myIndex = 0;
  bool isLoading = true;

  List<Widget> screensList = [
    HomeScreen(),
    Discover(),
    Favourites(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.loadData && isLoading) {
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isLoading = false; // Update loading state to false
        });
      });
    }

    return Scaffold(
      body: isLoading
          ? Center(
              child: AppLoadingIndicator(
                color: AppColors.lightText,
              ),
            )
          : screensList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.lightText,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_outlined), label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ]),
    );
  }
}
