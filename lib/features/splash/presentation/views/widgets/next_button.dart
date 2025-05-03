
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(31),
          border: Border.all(
            color: AppColor.kPrimaryColor,
            width: 2,
          ),
        ),
        height: 45,
        child: const Center(
          child: Text(
            "متابعة",
            style: Styles.textStyle20,
          ),
        ),
      ),
    );
  }
}
