



import 'package:flutter/material.dart';

import 'onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: OnboardingContent(
            title: title,
            subTitle: subTitle,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}