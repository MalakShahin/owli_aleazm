

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_button.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Alert Dialog Title'),
        content: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: AppColor.kTabBarColor,
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'تم بنجاح',
                style: Styles.textStyle24.copyWith(
                  color: AppColor.kBlackColor,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'لقد تم إعادة تعيين كلمة المرور الخاصة بك بنجاح.',
                style: Styles.textStyle16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onTap: () {
                 GoRouter.of(context).push(AppRouter.kMyHomeView);
              },
              text: "تسجيل الدخول",
            ),
          ),
        ],
      );
    },
  );
}