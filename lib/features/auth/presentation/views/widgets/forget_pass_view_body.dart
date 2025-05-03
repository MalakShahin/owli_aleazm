import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'title_and_description.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'form_item.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TitleAndDescription(
              title: "نسيت كلمة المرور؟",
              description: "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك، وسنرسل لك رمز التأكيد",
            ),
            const SizedBox(height: 25),
            const FormItem(
              text: "البريد الالكتروني",
              keyboardType: TextInputType.emailAddress,
              hint: "ادخل بريدك الالكتروني",
            ),
            const SizedBox(height: 25),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kVerificationCodeView);
              },
              text: "ارسال",
            ),
          ],
        ),
      ),
    );
  }
}
