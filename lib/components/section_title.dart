import 'package:flutter/material.dart';
import 'package:propertypulse/settings/consts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios, // You can change the arrow icon to your preference
                  color: Colors.grey.shade900,
                  size: 16.0, // Adjust the size as needed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
