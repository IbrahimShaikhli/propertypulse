import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertypulse/authentication/auth.bloc/auth_bloc.dart';
import 'package:propertypulse/authentication/auth.bloc/auth_events.dart';
import 'package:propertypulse/authentication/auth.bloc/auth_states.dart';
import 'package:propertypulse/components/user_auth_code.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          //user is authenticated
          //display user information
          return _buildAuthenticatedProfile(state.user);
        } else {
          //user is not authenticated
          //show login button
          return _buildUnauthenticatedProfile();
        }
      },
    );
  }

  Widget _buildAuthenticatedProfile(User? user) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Dispatch SignOutEvent
              BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
            },
            child: const Text(
              'LOGOUT',
              style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        automaticallyImplyLeading: false,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(125),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40.0, color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              Text(
                user?.displayName ?? 'Unknown',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                user?.email ?? 'Unknown',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      ),
      body: _buildProfileOptions(),
    );
  }

  Widget _buildUnauthenticatedProfile() {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Show login bottom sheet
              _showLoginBottomSheet(context);
            },
            child: const Text(
              'LOGIN',
              style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(125.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 40.0, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Guest',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Please log in',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildProfileOptions(),
    );
  }

  Widget _buildProfileOptions() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileOption(context, 'Account Information', Icons.info),
            _buildProfileOption(context, 'Security', Icons.security),
            _buildProfileOption(context, 'Notification', Icons.notifications),
            _buildProfileOption(context, 'Language', Icons.description),
            _buildProfileOption(context, 'Terms & Condition', Icons.language),
            _buildProfileOption(context, 'Support Center', Icons.support_agent),
            _buildProfileOption(context, 'Privacy Policy', Icons.privacy_tip),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileOption(BuildContext context, String title, IconData icon) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800])),
      onTap: () {},
      trailing:  Icon(Icons.arrow_forward, color: Colors.grey[800]),
    ),
  );
}

void _showLoginBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return LoginForm(
        onLogin: (email, password) {
          // Dispatch SignInWithEmailAndPasswordEvent
          BlocProvider.of<AuthBloc>(context).add(
            SignInWithEmailAndPasswordEvent(email: email, password: password),
          );
        },
        onRegister: (email, password) {
          // Dispatch SignUpWithEmailAndPasswordEvent
          BlocProvider.of<AuthBloc>(context).add(
            SignUpWithEmailAndPasswordEvent(email: email, password: password),
          );
        },
        onSignInWithGoogle: () {
          // Dispatch SignInWithGoogleEvent
          BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
        },
      );
    },
  );
}

