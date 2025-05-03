import 'package:flutter/material.dart';
import 'skip_button.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import 'next_button.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.kOnboardingContainerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.textStyle32,
            ),
            Text(
              subTitle,
              style: Styles.textStyle24,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: NextButton(onTap: onTap),
                ),
                const SizedBox(width: 9),
                const Expanded(
                  child: SkipButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
