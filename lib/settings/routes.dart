// routes.dart

import 'package:flutter/material.dart';
import 'package:propertypulse/screens/favorite/favorite%20screen.dart';
import 'package:propertypulse/screens/get%20started/get_started_screen.dart';
import 'package:propertypulse/screens/messages/chatting_home_screen.dart';
import 'package:propertypulse/screens/profile/profile_screen.dart';
import 'package:propertypulse/screens/splash%20screen/splash_screen.dart';
import 'package:propertypulse/screens/home/home_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  GetStartedScreen.routeName: (context) => GetStartedScreen(),
  HomePage.routeName: (context) => HomePage(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  ChattingHomeScreen.routeName: (context) => ChattingHomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),

};
