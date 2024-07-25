import 'dart:async';
import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });

    return const Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Center(
        child: Icon(
          Icons.agriculture,
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
