import 'package:flutter/material.dart';
import 'package:praktpm2/screens/login/components/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: LoginBodyScreen(),
        ),
      ),
    );
  }
}