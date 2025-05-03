import 'package:flutter/material.dart';


import 'page_head.dart';
import 'sign_in_sign_up_form.dart';
import 'social_media_login.dart';

class SignInSignUpViewBody extends StatelessWidget {
  const SignInSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 45),
            PageHead(),
            SizedBox(height: 15),
            SignInSignUpForm(),
            SocialMediaLogin(),
          ],
        ),
      ),
    );
  }
}


