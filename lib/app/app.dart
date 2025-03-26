import 'package:expense_tracker/app/app_theme_data.dart';
import 'package:expense_tracker/features/auth/ui/screens/forgot_pass_sent_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/reset_password_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/set_app_pin.dart';
import 'package:expense_tracker/features/intro_screens/setup_account_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/signup_screen.dart';
import 'package:expense_tracker/features/intro_screens/onboarding_screen.dart';
import 'package:expense_tracker/features/intro_screens/splash_screen.dart';
import 'package:expense_tracker/features/setup_account/ui/screens/add_new_account_screen.dart';
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
        else if(setting.name == ForgotPasswordScreen.name) {
          widget = const ForgotPasswordScreen();
        }
        else if(setting.name == ForgotPassSentScreen.name) {
          widget = const ForgotPassSentScreen();
        }
        else if(setting.name == ResetPasswordScreen.name) {
          widget = const ResetPasswordScreen();
        }
        else if(setting.name == SignupScreen.name) {
          widget = const SignupScreen();
        }
        else if(setting.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        }
        else if(setting.name == SetAppPin.name) {
          String title = setting.arguments as String;
          widget = SetAppPin(title: title,);
        }
        else if(setting.name == SetupAccountScreen.name) {
          widget = const SetupAccountScreen();
        }

        else if(setting.name == AddNewAccountScreen.name) {
          widget = const AddNewAccountScreen();
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        });
      }
    );
  }
}
