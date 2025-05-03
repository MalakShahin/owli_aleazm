import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class AcceptTermsCheckbox extends StatelessWidget {
  const AcceptTermsCheckbox({
    super.key,
    required this.isChecked,
    this.onTap,
  });
  final bool isChecked;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isChecked == false
                  ? AppColor.kWhiteColor
                  : AppColor.kPrimaryColor,
              border: Border.all(
                color: AppColor.kGrayTextColor,
              ),
            ),
            child: isChecked
                ? const Icon(
                    size: 20,
                    Icons.check,
                    color: AppColor.kWhiteColor,
                  ) // Checkmark icon
                : null,
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'أوافق على',
            style: Styles.textStyle14,
            children: [
              TextSpan(
                text: ' شروط خدمة',
                style: Styles.textStyle16.copyWith(
                  color: AppColor.kPrimaryColor,
                ),
              ),
              const TextSpan(
                text: ' المنصة',
                style: Styles.textStyle14,
              ),
              TextSpan(
                text: ' وسياسة\nالخصوصية',
                style: Styles.textStyle16.copyWith(
                  color: AppColor.kPrimaryColor,
                   height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
