import 'package:flutter/material.dart';
import 'package:propertypulse/components/bottom_nav_bar.dart';
import 'package:propertypulse/screens/home/home_body.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasNotifications = true; // Set this to true if there are notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: HomeBody(hasNotifications: hasNotifications),
    );
  }
}


