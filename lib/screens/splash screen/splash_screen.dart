// Import the necessary packages
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import the flutter_animate package
import 'package:propertypulse/screens/get%20started/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showAppName = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showAppName = true;
      });
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, GetStartedScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              'assets/animations/Animation - 1693749965027.json',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              animate: true,
              onLoaded: (composition) {
                Future.delayed(
                  Duration(milliseconds: composition.duration.inMilliseconds - 1000),
                      () {
                    setState(() {
                      showAppName = true;
                    });
                  },
                );
              },
            ),
            if (showAppName)
              Animate( // Use Animate from flutter_animate for the fade-in effect
                effects: [const FadeEffect()], // Use Animate from flutter_animate for the fade-in effect
                child: const Text(
                  'Property Pulse',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Apply the FadeEffect
              ),
          ],
        ),
      ),
    );
  }
}
