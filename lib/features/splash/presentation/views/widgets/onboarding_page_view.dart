


import 'package:flutter/material.dart';

import 'onboarding_page.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;
  final void Function()? onTap;

  const OnboardingPageView({super.key,
    required this.controller,
    required this.onPageChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children:  [
        OnboardingPage(
          onTap: onTap,
          image: "assets/images/img_2.png",
          title: "مرحباً!",
          subTitle:
          "ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك.",
        ),
        OnboardingPage(
          onTap: onTap,
          image: "assets/images/img_1.png",
          title: "خطط مخصصة",
          subTitle:
          "ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار.",
        ),
        OnboardingPage(
          onTap: onTap,
          image: "assets/images/img_3.png",
          title: "حافظ على التحفيز",
          subTitle:
          "استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن.",
        ),
      ],
    );
  }
}