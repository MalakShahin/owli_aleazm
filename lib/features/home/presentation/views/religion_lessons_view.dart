


import 'package:flutter/material.dart';

import 'widgets/religion_lessons_view_body.dart';

class ReligionLessonsView extends StatelessWidget {
  const ReligionLessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ReligionLessonsViewBody(),
        ),
      ),
    );
  }
}
