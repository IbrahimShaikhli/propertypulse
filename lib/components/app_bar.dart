import 'package:flutter/material.dart';
import 'package:propertypulse/settings/consts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      automaticallyImplyLeading: false, // Remove the back button
      title: const Text(
        'Property Pulse',
        style: TextStyle(
          color: Colors.white, // Set text color to match your bottom nav bar
          fontSize: 20.0, // Adjust the font size as needed
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white), // Set icon color
          onPressed: () {
            // Handle notifications press
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white), // Set icon color
        ),
      ],
      elevation: 0, // Remove the elevation
      backgroundColor: Colors.black, // Set the background color to match your bottom nav bar
    );
  }
}