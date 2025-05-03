


import 'package:flutter/material.dart';

import 'widgets/hadith_book_view_body.dart';

class HadithBookView extends StatelessWidget {
  const HadithBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: HadithBookViewBody(),
        ),
      ),
    );
  }
}
