



import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/styels.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text, this.color,
  });

  final void Function()? onTap;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [
              AppColor.kPrimaryColor,
              AppColor.kGradientColor,
            ], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle18,
          ),
        ),
      ),
    );
  }
}