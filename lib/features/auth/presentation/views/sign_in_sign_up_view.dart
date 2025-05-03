import 'package:flutter/material.dart';

import 'widgets/sign_in_sign_up_view_body.dart';

class SignInSignUpView extends StatelessWidget {
  const SignInSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SignInSignUpViewBody(),
        ),
      ),
    );
  }
}
