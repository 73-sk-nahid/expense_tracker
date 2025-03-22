import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/auth/ui/screens/login_screen.dart';
import 'package:expense_tracker/features/auth/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String name = "/onboarding-screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    _buildPage2(
                        'assets/illustration/onboarding1.png',
                        'Gain total control of our money',
                        'Become your own money manager and make every cent count'),
                    _buildPage2(
                        'assets/illustration/onboarding2.png',
                        'Know where your money goes',
                        'Track your transaction easily, with categories and financial report'),
                    _buildPage2(
                        'assets/illustration/onboarding3.png',
                        'Planning ahead',
                        'Setup your budget for each category so you in control'),
                  ],
                ),
                //add smooth page indicator here
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.themeColor,
                      dotColor: AppColors.violet20,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3),
                ),
              ),
              _buildBottomButtons(mediaQuery),
            ],
          ),

          /// Skip Button in the top-right corner
          Positioned(
            top: mediaQuery.padding.top + 16,
            right: 16,
            child: TextButton(
              onPressed: () {
                _pageController.animateToPage(
                  3, // Index of the last page
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(imagePath, titleText, bodyText) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath,
              height: MediaQuery.of(context).size.height * 0.5),
          Text(titleText,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),
          Text(bodyText,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  /// Bottom section with Sign Up & Login buttons
  Widget _buildBottomButtons(MediaQueryData mediaQuery) {
    return Container(
      height: mediaQuery.size.height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle Sign Up action
              Navigator.pushNamed(context, SignupScreen.name);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // Handle Login action
              Navigator.pushNamed(context, LoginScreen.name);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor:
                  AppColors.violet20, // Different color for Login button
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                  color: AppColors.themeColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
