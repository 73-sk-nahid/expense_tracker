import 'package:expense_tracker/app/app_theme_data.dart';
import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/signup_screen.dart';
import 'package:expense_tracker/features/intro_screens/onboarding_screen.dart';
import 'package:expense_tracker/features/intro_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if(setting.name == SplashScreen.name) {
          widget = const SplashScreen();
        }
        else if(setting.name == OnboardingScreen.name) {
          widget = const OnboardingScreen();
        }
        else if(setting.name == LoginScreen.name) {
          widget = const LoginScreen();
        }
        else if(setting.name == SignupScreen.name) {
          widget = const SignupScreen();
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        });
      }
    );
  }
}
