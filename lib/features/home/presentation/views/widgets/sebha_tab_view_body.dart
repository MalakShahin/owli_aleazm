import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';

import 'custom_app_bar.dart';

class SebhaTabViewBody extends StatefulWidget {
  const SebhaTabViewBody({super.key});

  @override
  State<SebhaTabViewBody> createState() => _SebhaTabViewBodyState();
}

class _SebhaTabViewBodyState extends State<SebhaTabViewBody> {
  int tasbehCounter = 0;
  int index = 0;

  List<String> tasbehList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  void onTap() {
    setState(() {
      tasbehCounter++;
      if (tasbehCounter == 33) {
        tasbehCounter = 0;
        index++;
      }
      if (index == tasbehList.length) {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'التَّسْبِيح',
          navBar: true,
        ),
        const SizedBox(height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                tasbehList[index],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'عدد التسبيحات',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '$tasbehCounter',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: AppColor.kPrimaryColor,
                  width: 79,
                  height: 79,
                  child: const Icon(
                    Icons.fingerprint_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
