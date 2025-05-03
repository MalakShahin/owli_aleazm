


import 'package:flutter/material.dart';

import 'widgets/quran_view_body.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: QuranViewBody(),
        ),
      ),
    );
  }
}
