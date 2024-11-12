import 'package:clario_test/commonents/background_widget.dart';
import 'package:clario_test/resources/strings.dart';
import 'package:clario_test/screens/signup/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SignUpForm(
                onSignUpSuccess: _onSignUpSuccess,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignUpSuccess() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.signUpSuccess),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(AppStrings.ok),
          ),
        ],
      ),
    );
  }
}
