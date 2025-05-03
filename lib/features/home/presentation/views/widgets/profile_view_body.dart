import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'Build_profile_view_header.dart';
import 'build_profile_view_list_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BuildHeader(),
          const SizedBox(height: 40),
          BuildListTile(
            title: "تعديل الملف الشخصي",
            iconPath: "assets/images/img_16.png",
            onTap: () {},
          ),
          BuildListTile(
            title: "عدد النقاط",
            iconPath: "assets/images/img_17.png",
            onTap: () {},
          ),
          BuildListTile(
            title: "المُحفظ",
            iconPath: "assets/images/img_18.png",
            onTap: () {},
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 160),
            child: CustomButton(
              onTap: () {},
              text: "تسجيل الخروج",
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
