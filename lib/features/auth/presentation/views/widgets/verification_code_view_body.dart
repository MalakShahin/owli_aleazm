import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'pin_input_section.dart';
import 'show_alert_dialog.dart';
import 'title_and_description.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

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
              title: "رمز التحقق",
              description: "أدخل الرمز الذي أرسلناه إلى رقمك 012345*****",
            ),
            const SizedBox(height: 25),
            const PinInputSection(),
            const SizedBox(height: 35),
            CustomButton(
              onTap: () {
                showAlertDialog(context);
              },
              text: "تحقق",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'لم تستلم الرمز؟',
                  style: Styles.textStyle16,
                ),
                Text(
                  ' إعادة ارسال',
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
