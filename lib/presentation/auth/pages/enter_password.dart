import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/auth/model/user_signin_req.dart';
import 'package:ecommerce/domain/auth/usecases/signin.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq userSigninReq;
  EnterPasswordPage({required this.userSigninReq, super.key});

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackBar = SnackBar(
                  content: Text(state.errorMesssage),
                  behavior: SnackBarBehavior.floating,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signInText(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(context),
                const SizedBox(height: 20),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
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
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          userSigninReq.password = _passwordCon.text;
          context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: userSigninReq,
              );
        },
        title: 'Continue',
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Forgot password? ",
          ),
          TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
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
