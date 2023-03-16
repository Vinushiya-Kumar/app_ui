import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'constants.dart';
// ignore: unused_import

void main() {
  runApp(InitialScreen());
}

// ignore: use_key_in_widget_constructors
class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
