



import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_back_arrow.dart';

class TitleAndDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomBackArrow(),
        const SizedBox(height: 15),
        Text(
          title,
          style: Styles.textStyle24.copyWith(
            color: AppColor.kPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),  // Space between title and description
        Text(
          description,
          style: Styles.textStyle16,
        ),
      ],
    );
  }
}
