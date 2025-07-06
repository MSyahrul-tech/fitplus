// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedFontSize: 18,
      unselectedFontSize: 15,
      selectedIconTheme: const IconThemeData(color: Color(0xff7F70D7)),
      iconSize: 30,
      selectedLabelStyle: const TextStyle(fontFamily: "Poppins", fontSize: 16),
      unselectedLabelStyle: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
      ),
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 25),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 25),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people, size: 25),
          label: "Account",
        ),
      ],
    );
  }
}
