import 'package:expense_tracker/app/app_colors.dart';
import 'package:flutter/material.dart';

class SetAppPin extends StatefulWidget {
  const SetAppPin({super.key});

  static const String name = '/set-app-pin';

  @override
  State<SetAppPin> createState() => _SetAppPinState();
}

class _SetAppPinState extends State<SetAppPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Center(
        child: Text('Let\'s setup your PIN', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
      ),
    );
  }
}