import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Login Page!'),
      ),
    );
  }
}
// call to https, superbase - backend
//storing the authentication token securely and refreshing it when necessary