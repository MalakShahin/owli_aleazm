

import 'package:flutter/material.dart';
import 'widgets/hadith_view_body.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key, required this.bookId,});
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: HadithViewBody(
            bookId: bookId,
          ),
        ),
      ),
    );
  }
}
