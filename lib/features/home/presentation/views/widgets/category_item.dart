import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
  });
  final void Function()? onTap;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.kGradientColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: 32,
                width: 32,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: Styles.textStyle16.copyWith(
              color: AppColor.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
