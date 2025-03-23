import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassSentScreen extends StatelessWidget {
  const ForgotPassSentScreen({super.key});

  static const String name = '/forgot-pass-sent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/illustration/pass_sent.png',
                  height: MediaQuery.of(context).size.height * 0.5),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your email is on the way',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Check your email test@test.com and follow the instructions to reset your password',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.name);
                },
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
