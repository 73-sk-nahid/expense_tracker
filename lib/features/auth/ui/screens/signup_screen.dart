import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String name = '/signup-screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility,
                        color: AppColors.light20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                        // Handle checkbox state change
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to the ',
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Services and Privacy Policy',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.themeColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.name);
                  },
                  child: Text('Sign Up'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Or with',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.light20),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.white), // Use MaterialStateProperty
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Keeps button size minimal
                    children: [
                      Image.asset(
                        'assets/icons/google_icon.png', // Google logo (use an asset)
                        height: 24, // Adjust size as needed
                        width: 24,
                      ),
                      const SizedBox(width: 10), // Space between icon and text
                      Text(
                        'Sign Up with Google',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.light20),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.themeColor),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
