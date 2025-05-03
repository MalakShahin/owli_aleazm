



import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({super.key, required this.title, required this.iconPath, this.onTap});

  final String title;
  final String iconPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: Styles.textStyle20.copyWith(
              color: AppColor.kBlackColor,
            ),
          ),
          leading: Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
      ],
    );
  }
}