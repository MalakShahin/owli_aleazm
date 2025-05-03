




import 'package:flutter/material.dart';

import 'build_daily_card.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BuildDailyCard(
          title: "آية اليوم",
          text: "أَلَمۡ یَأۡنِ لِلَّذِینَ ءَامَنُوۤا۟ أَن تَخۡشَعَ قُلُوبُهُمۡ لِذِكۡرِ ٱللَّهِ وَمَا نَزَلَ مِنَ ٱلۡحَقِّ وَلَا یَكُونُوا۟ كَٱلَّذِینَ أُوتُوا۟ ٱلۡكِتَـٰبَ مِن قَبۡلُ فَطَالَ عَلَیۡهِمُ ٱلۡأَمَدُ فَقَسَتۡ قُلُوبُهُمۡۖ وَكَثِیرࣱ مِّنۡهُمۡ فَـٰسِقُونَ﴾",
        ),
        SizedBox(
          height: 20,
        ),
        BuildDailyCard(
          title: "حديث اليوم",
          text: "قال رسول الله صلى الله عليه وسلم: (إنَّ مِن أحبِّكم إليَّ وأقربِكُم منِّي مجلسًا يومَ القيامةِ أحاسنَكُم أخلاقًا",
        ),
      ],
    );
  }
}