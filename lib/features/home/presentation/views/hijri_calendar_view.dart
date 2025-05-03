import 'package:flutter/material.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';
import '../../../../core/widgets/custom_back_arrow.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/styels.dart';

class HijriCalendarView extends StatelessWidget {
  const HijriCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: IslamicHijriCalendar(
            highlightBorder: AppColor.kPrimaryColor,
            adjustmentValue: 0,
            isGoogleFont: true,
            fontFamilyName: "Lato",
            getSelectedEnglishDate: (selectedDate) {
              print("English Date : $selectedDate");
            },
            getSelectedHijriDate: (selectedDate) {
              print("Hijri Date : $selectedDate");
            },
            isDisablePreviousNextMonthDates: true,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: AppColor.kGradientColor,
      title: const Text(
        "التقويم",
        style: Styles.textStyle24,
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16),
          child: CustomBackArrow(),
        ),
      ],
      leading: const Text(""),
    );
  }
}
