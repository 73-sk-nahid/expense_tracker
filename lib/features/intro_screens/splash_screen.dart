import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:expense_tracker/features/intro_screens/setup_account_screen.dart';
import 'package:expense_tracker/features/setup_account/ui/screens/add_new_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
          children: [
            Lottie.asset(
              'assets/lottieFiles/Animation - 1742669456392.json',
              height: MediaQuery.of(context).size.height * 0.8,
              repeat: false,
              onLoaded: (composition) {
                Future.delayed(composition.duration, () {
                  Navigator.pushNamed(context, AddNewAccountScreen.name);
                });
              },
            ),
            const SizedBox(height: 5), // Adds spacing between animation and text
            Text(
              'Expense Tracker',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40,),
            Text('Sk. Nahid - version: 1.0', style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}
