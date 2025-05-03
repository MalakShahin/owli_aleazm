import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "خيارات تسجيل الدخول الأخرى",
          style: Styles.textStyle14.copyWith(
            color: AppColor.kBlackColor,
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaLoginItem(
              icon: Icons.apple_outlined,
              size: 30,
            ),
            SizedBox(width: 10),
            SocialMediaLoginItem(
              icon: Icons.g_mobiledata,
              size: 30,
            ),
            SizedBox(width: 10),
            SocialMediaLoginItem(
              icon: Icons.facebook_outlined,
              size: 30,
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class SocialMediaLoginItem extends StatelessWidget {
  const SocialMediaLoginItem({
    super.key,
    this.icon,
    this.size,
  });

  final IconData? icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColor.kGrayTextColor.withOpacity(.5),
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
