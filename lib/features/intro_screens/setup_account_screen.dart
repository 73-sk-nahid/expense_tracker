import 'package:expense_tracker/features/setup_account/ui/screens/add_new_account_screen.dart';
import 'package:flutter/material.dart';

class SetupAccountScreen extends StatefulWidget {
  const SetupAccountScreen({super.key});

  static const String name = '/setup-account';

  @override
  State<SetupAccountScreen> createState() => _SetupAccountScreenState();
}

class _SetupAccountScreenState extends State<SetupAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 140,
            ),
            Text(
              'Let\'s setup your account!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Account can be your bank, credit card or your wallet',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddNewAccountScreen.name);
              },
              child: Text('Let\'s go'),
            ),
          ],
        ),
      ),
    );
  }
}
