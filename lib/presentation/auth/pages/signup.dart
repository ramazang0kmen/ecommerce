import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(),
            const SizedBox(height: 20),
            _firstNameField(),
            const SizedBox(height: 20),
            _lastNameField(),
            const SizedBox(height: 20),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(
        hintText: 'Enter First Name',
      ),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(
        hintText: 'Enter Last Name',
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
            context,
            GenderAndAgeSelection(
              userCreationReq: UserCreationReq(
                firstName: _firstNameCon.text,
                lastName: _lastNameCon.text,
                email: _emailCon.text,
                password: _passwordCon.text,
              ),
            ));
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Do you have an account? ",
          ),
          TextSpan(
            text: 'Sign in',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, const SignInPage());
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
