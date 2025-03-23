import 'package:expense_tracker/app/app_colors.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name = '/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reset Password',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: buildIcon(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Retype new Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: buildIcon(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ));
  }

  Icon buildIcon() {
    return Icon(
      Icons.visibility,
      color: AppColors.light20,
    );
  }
}
