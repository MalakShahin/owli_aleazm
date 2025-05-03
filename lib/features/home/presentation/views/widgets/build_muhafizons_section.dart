




import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class BuildMuhafizonsSection extends StatelessWidget {
  const BuildMuhafizonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: 195,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _buildMuhafizonCard(),
            ),
          ),
        ],
      ),
    );
  }
}


// Reusable widget for the section header
Widget _buildSectionHeader() {
  return Row(
    children: [
      Text(
        "المُحفظون",
        style: Styles.textStyle20.copyWith(
          color: AppColor.kBlack30Color,
        ),
      ),
      const Spacer(),
      Text(
        "عرض الكل",
        style: Styles.textStyle16.copyWith(
          color: AppColor.kPrimaryColor,
        ),
      ),
      const Icon(
        Icons.arrow_forward_ios_sharp,
        color: AppColor.kPrimaryColor,
        size: 20,
      ),
    ],
  );
}


// Reusable widget for each "المُحفظون" card
Widget _buildMuhafizonCard() {
  return Card(
    child: Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildCardImage(),
          _buildCardContent(),
        ],
      ),
    ),
  );
}

// Reusable widget for the card image section
Widget _buildCardImage() {
  return Container(
    decoration: const BoxDecoration(
      color: AppColor.kPrimaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
    ),
    child: Center(
      child: Image.asset(
        "assets/images/mosque-sultan-ahmed.jpg",
        height: 100,
        width: 100,
        fit: BoxFit.fill,
      ),
    ),
  );
}

// Reusable widget for the card content section (name, role, reviews)
Widget _buildCardContent() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "محمد علي",
          style: Styles.textStyle16.copyWith(
            color: AppColor.kNameColor,
          ),
        ),
        const Text("مُحفظ", style: Styles.textStyle14),
        Row(
          children: [
            Text(
              "المراجعات",
              style: Styles.textStyle16.copyWith(
                color: AppColor.kName1Color,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.star_rounded,
              color: AppColor.kYellowColor,
              size: 18,
            ),
            const Text("4.6", style: Styles.textStyle14),
          ],
        ),
      ],
    ),
  );
}


