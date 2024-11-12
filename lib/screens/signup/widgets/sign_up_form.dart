import 'package:clario_test/commonents/custom_text_form_field.dart';
import 'package:clario_test/resources/colors.dart';
import 'package:clario_test/resources/strings.dart';
import 'package:clario_test/screens/signup/widgets/gradient_button.dart';
import 'package:clario_test/screens/signup/widgets/password_requirements_widget.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final VoidCallback onSignUpSuccess;

  const SignUpForm({required this.onSignUpSuccess, super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late bool _isPasswordVisible;

  late Color _lengthRequirementColor;
  late Color _uppercaseRequirementColor;
  late Color _digitRequirementColor;

  bool? _isEmailValid;
  bool? _isPasswordValid;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _isPasswordVisible = false;

    _lengthRequirementColor = AppColors.grey;
    _uppercaseRequirementColor = AppColors.grey;
    _digitRequirementColor = AppColors.grey;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _emailController,
          isValid: _isEmailValid,
          hint: AppStrings.emailHint,
          onChanged: (value) {
            setState(() {
              _isEmailValid = null;
            });
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _passwordController,
          isValid: _isPasswordValid,
          obscureText: !_isPasswordVisible,
          hint: AppStrings.passwordHint,
          onChanged: (value) {
            setState(() {
              _isPasswordValid = null;
            });
          },
          suffixIcon: IconButton(
            icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: _getSuffixIconColor(_isPasswordValid)),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        PasswordRequirements(
          lengthRequirementColor: _lengthRequirementColor,
          uppercaseRequirementColor: _uppercaseRequirementColor,
          digitRequirementColor: _digitRequirementColor,
        ),
        const SizedBox(height: 30),
        Center(
          child: GradientButton(
            text: AppStrings.signUpButton,
            onPressed: _onSignUpPressed,
          ),
        ),
      ],
    );
  }

  void _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      _isEmailValid = false;
      return;
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      _isEmailValid = false;
      return;
    }
    _isEmailValid = true;
  }

  void _validatePassword(String value) {
    bool isValid = true;
    if (value.length >= 8 && value.length <= 64) {
      _lengthRequirementColor = AppColors.green;
    } else {
      _lengthRequirementColor = AppColors.red;
      isValid = false;
    }
    if (RegExp(r'[A-Z]').hasMatch(value)) {
      _uppercaseRequirementColor = AppColors.green;
    } else {
      _uppercaseRequirementColor = AppColors.red;
      isValid = false;
    }
    if (RegExp(r'\d').hasMatch(value)) {
      _digitRequirementColor = AppColors.green;
    } else {
      _digitRequirementColor = AppColors.red;
      isValid = false;
    }
    _isPasswordValid = isValid;
  }

  void _onSignUpPressed() {
    _validateEmail(_emailController.text);
    _validatePassword(_passwordController.text);
    setState(() {});
    if (_isEmailValid == true && _isPasswordValid == true) {
      widget.onSignUpSuccess();
    }
  }

  Color _getSuffixIconColor(bool? isValid) {
    if (isValid == true) {
      return AppColors.green;
    } else if (isValid == false) {
      return AppColors.red;
    } else {
      return AppColors.grey;
    }
  }
}
