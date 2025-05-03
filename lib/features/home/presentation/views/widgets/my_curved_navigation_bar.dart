
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_color.dart';

class MyCurvedNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;

  const MyCurvedNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedIndex,
      items: const [
        Icon(
          Icons.home,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
        Icon(
          Icons.mosque_outlined,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
        FaIcon(
          FontAwesomeIcons.bookOpen,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
        FaIcon(
          FontAwesomeIcons.handsHolding,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
        Icon(
          Icons.settings,
          color: AppColor.kWhiteColor,
          size: 30,
        ),
      ],
      backgroundColor: Colors.transparent,
      letIndexChange: (index) => true,
      animationDuration: const Duration(milliseconds: 300),
      buttonBackgroundColor: AppColor.kGradientColor,
      color: AppColor.kGradientColor,
      onTap: onTap,  // Callback when an item is tapped
    );
  }
}


