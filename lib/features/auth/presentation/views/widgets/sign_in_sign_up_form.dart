import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../manager/signin_signup_cubit/signin_sinup_cubit.dart';
import 'accept_terms_checkbox.dart';
import 'form_item.dart';
import '../../../../../core/widgets/tab_bar_title.dart';

class SignInSignUpForm extends StatefulWidget {
  const SignInSignUpForm({super.key});

  @override
  State<SignInSignUpForm> createState() => _SignInSignUpFormState();
}

class _SignInSignUpFormState extends State<SignInSignUpForm> {
  bool isSignIn = false;
  late bool _isChecked = false;
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninSignupCubit, SigninSignupState>(
        listener: (context, state) {
      if (state is SigninSignupLoading) {
        isLoading = true;
      } else if (state is SigninSignupSuccess) {
        GoRouter.of(context).push(AppRouter.kMyHomeView);
        isLoading = false;
        showSnackBar(context, "Success!");
      } else if (state is SigninSignupFailure) {
        isLoading = false;
        showSnackBar(context, state.errMessage);
        print("Failure");
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TabBarTitle(
              isSignIn: isSignIn,
              textOne: "تسجيل الدخول",
              textTwo: "إنشاء حساب",
              onTabChanged: (bool newValue) {
                setState(() {
                  isSignIn = newValue;
                });
              },
            ),
            const SizedBox(height: 25),
            FormItem(
              validator: (data) {
                if (data!.isEmpty) {
                  return 'email is required';
                }
                return null;
              },
              onChanged: (value) {
                email = value;
              },
              text: "البريد الالكتروني",
              keyboardType: TextInputType.emailAddress,
              hint: "ادخل بريدك الالكتروني",
            ),
            FormItem(
              validator: (data) {
                if (data!.isEmpty) {
                  return 'enter your password';
                }
                return null;
              },
              onChanged: (value) {
                password = value;
              },
              text: "كلمة المرور",
              keyboardType: TextInputType.visiblePassword,
              hint: "ادخل كلمة المرور",
              obscureText: true,
            ),
            if (isSignIn == true)
              FormItem(
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'reenter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                },
                text: "تأكيد كلمة المرور",
                keyboardType: TextInputType.visiblePassword,
                hint: "ادخل كلمة المرور",
                obscureText: true,
              ),
            if (isSignIn == true)
              AcceptTermsCheckbox(
                isChecked: _isChecked,
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
              ),
            if (isSignIn == false) const ForgetPassText(),
            const SizedBox(height: 25),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kPrimaryColor,
                    ),
                  )
                : CustomButton(
                    onTap: () {
                      if (isSignIn == true) {
                        print("true");
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SigninSignupCubit>(context)
                              .registerUser(
                            email: email,
                            password: password,
                          );
                        }
                      } else {
                        print("false");
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SigninSignupCubit>(context).logInUser(
                            email: email,
                            password: password,
                          );
                        }
                      }
                      // GoRouter.of(context).push(AppRouter.kMyHomeView);
                    },
                    text: "تسجيل الدخول",
                  ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kForgetPassView);
      },
      child: Text(
        "نسيت كلمة المرور؟",
        style: Styles.textStyle14.copyWith(
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
