import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microchirp_frontend/routes.dart';

@RoutePage(name: 'SplashScreenPage')
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(
        milliseconds: 1500
      ), () {
        context.router.popAndPush(const LoginPage());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: CircleAvatar(
          child: Image.asset(
            'assets/microchirp-transparent.png',
          ),
          radius: 100,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
