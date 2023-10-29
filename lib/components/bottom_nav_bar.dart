import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:propertypulse/screens/favorite/favorite%20screen.dart';
import 'package:propertypulse/screens/home/home_screen.dart';
import 'package:propertypulse/screens/messages/chatting_home_screen.dart';
import 'package:propertypulse/screens/profile/profile_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          FavoriteScreen(),
          ChattingHomeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        activeColor: Colors.blue, // Change to your active color
        color: Colors.white,
        tabBackgroundColor: Colors.grey.shade900,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Saved',
          ),
          GButton(
            icon: Icons.message_outlined,
            text: 'Messages',
          ),
          GButton(
            icon: Icons.person_2,
            text: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
