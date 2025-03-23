import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verify';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late int secondsRemaining;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    setState(() {
      secondsRemaining = 120; // Set initial timer to 2 minutes
      enableResend = false; // Disable resend button
    });

    timer?.cancel(); // Cancel any existing timer before starting a new one

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
        timer?.cancel(); // Stop timer when countdown ends
      }
    });
  }

  String getFormattedTime() {
    int minutes = secondsRemaining ~/ 60;
    int seconds = secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _resendCode() {
    _startResendCodeTimer(); // Restart the timer
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: Text('Verification',
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Enter your Verification Code',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,
              hintCharacter: '•',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 22),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveColor: Colors.transparent,
                activeColor: Colors.transparent,
                selectedColor: Colors.transparent,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              showCursor: true,
              enableActiveFill: true,
              autoDismissKeyboard: true,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              beforeTextPaste: (text) => true,
              pastedTextStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              appContext: context,
            ),
            const SizedBox(height: 16),
            Text(
              getFormattedTime(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.blue),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'We sent a verification code to your email ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'na***********00@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'I didn\'t receive the code? ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  if (enableResend)
                    TextSpan(
                      text: 'Send again',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = _resendCode,
                    )
                  else
                    TextSpan(
                      text: 'Send again',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
