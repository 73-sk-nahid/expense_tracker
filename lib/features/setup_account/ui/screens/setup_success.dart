import 'dart:async';

import 'package:expense_tracker/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SetupSuccess extends StatefulWidget {
  const SetupSuccess({super.key});

  static const String name = '/setup-success';

  @override
  State<SetupSuccess> createState() => _SetupSuccessState();
}

class _SetupSuccessState extends State<SetupSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, HomeScreen.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/ok_icon.png'),
            Text(
              'You are set!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
