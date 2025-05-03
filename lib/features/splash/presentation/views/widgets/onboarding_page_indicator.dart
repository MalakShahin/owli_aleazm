



import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_color.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final PageController controller;

  const OnboardingPageIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.white,
        activeDotColor: AppColor.kPrimaryColor,
      ),
    );
  }
}