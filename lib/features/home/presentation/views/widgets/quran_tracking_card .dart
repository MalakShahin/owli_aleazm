import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class QuranTrackingCard extends StatelessWidget {
  const QuranTrackingCard({
    super.key,
    required this.surahName,
    required this.currentAyah,
    this.onPressed,
  });
  final String surahName;
  final int currentAyah;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: const AssetImage("assets/images/mosque-sultan-ahmed.jpg"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              QuranTrackingText(
                surahName: surahName,
                currentAyah: currentAyah,
                onPressed: onPressed,
              ),
              const Spacer(),
              const QuranTrackingImage(),
            ],
          ),
        ),
      ),
    );
  }
}

class QuranTrackingText extends StatelessWidget {
  const QuranTrackingText({
    super.key,
    required this.surahName,
    required this.currentAyah,
    this.onPressed,
  });
  final String surahName;
  final int currentAyah;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "متابعة القرآن من حيث توقفت",
          style: Styles.textStyle16.copyWith(
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SurahAndPageRow(
          surahName: surahName,
        ),
        PageRow(
          currentAyah: currentAyah,
        ),
        FollowButton(
          onPressed: onPressed,
        ),
      ],
    );
  }
}

class SurahAndPageRow extends StatelessWidget {
  const SurahAndPageRow({
    super.key,
    required this.surahName,
  });
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "توقفت عند ",
          style: Styles.textStyle14.copyWith(
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          surahName,
          style: Styles.textStyle18.copyWith(
            color: AppColor.kYellowColor,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class PageRow extends StatelessWidget {
  const PageRow({
    super.key,
    required this.currentAyah,
  });
  final int currentAyah;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "ايه رقم ",
          style: Styles.textStyle16.copyWith(
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "$currentAyah",
          style: Styles.textStyle18.copyWith(
            color: AppColor.kYellowColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Text(
        'متابعة الحفظ',
        style: Styles.textStyle16.copyWith(
          color: AppColor.kWhiteColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor.kPrimaryColor),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
      ),
    );
  }
}

class QuranTrackingImage extends StatelessWidget {
  const QuranTrackingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      width: 99,
      fit: BoxFit.fill,
      image: AssetImage("assets/images/img_12.png"),
    );
  }
}
