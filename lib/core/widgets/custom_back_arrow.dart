import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_color.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key,});
  // final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: AppColor.kWhiteColor,
            border: Border.all(
              color: AppColor.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
