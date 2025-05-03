



import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class BuildDailyCard extends StatelessWidget {
  const BuildDailyCard({super.key, required this.title, required this.text});

  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("assets/images/img_15.png"),
                      height: 18,
                      width: 18,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: Styles.textStyle20,
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage("assets/images/img_14.png"),
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 5),
                    const Image(
                      image: AssetImage("assets/images/img_13.png"),
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColor.kPrimaryColor,
                thickness: .3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical:  8.0),
                child: Text(
                  text,
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kBlack30Color,
                  ),
                  // maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}