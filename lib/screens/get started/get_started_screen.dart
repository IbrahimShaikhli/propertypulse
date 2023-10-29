import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:propertypulse/components/bottom_nav_bar.dart';
import 'package:propertypulse/settings/consts.dart';

class GetStartedScreen extends StatefulWidget {
  static const String routeName = '/get_started';

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      animationPath: 'assets/animations/Animation - 1693751582318.json',
      title: 'Search for Properties',
      description: 'Find your dream home with Property Pulse!',
    ),
    const OnboardingPage(
      animationPath: 'assets/animations/Animation - 1693751629524.json',
      title: 'Get Property Details',
      description: 'Get all the details of the property you like.',
    ),
    // Add more onboarding pages as needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Use the custom background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _pages.length; i++)
                if (i == _currentPage)
                  PageIndicator(isActive: true)
                else
                  PageIndicator(isActive: false),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_currentPage < _pages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomNavBar(),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor, // Use the custom call-to-action color
            ),
            child: Text(
              _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String animationPath;
  final String title;
  final String description;

  const OnboardingPage({super.key,
    required this.animationPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'dotLottie',
            child: Lottie.asset(
              animationPath,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
              animate: true,
            ),
          ),
          Animate(
            effects: [const FadeEffect()],
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Animate(
            effects: [const FadeEffect()],
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;

  PageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? primaryColor : Colors.grey,
      ),
    );
  }
}
