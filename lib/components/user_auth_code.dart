import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function(String, String) onLogin;
  final Function(String, String) onRegister;
  final Function() onSignInWithGoogle;

   LoginForm({
    Key? key,
    required this.onLogin,
    required this.onRegister,
    required this.onSignInWithGoogle,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              // Call onLogin with the email and password
              widget.onLogin(emailController.text, passwordController.text);
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              // Call onRegister with the email and password
              widget.onRegister(emailController.text, passwordController.text);
            },
            child: const Text('Register'),
          ),
          ElevatedButton(
            onPressed: widget.onSignInWithGoogle,
            child: const Text('Sign in with Google'),
          ),
        ],
      ),
    );
  }
}
