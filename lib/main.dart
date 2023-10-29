import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:propertypulse/screens/splash%20screen/splash_screen.dart';
import 'package:propertypulse/settings/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertypulse/authentication/auth.bloc/auth_bloc.dart';

Future<void> main() async {

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: SplashScreen.routeName,
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
