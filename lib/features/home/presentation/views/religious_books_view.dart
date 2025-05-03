

import 'package:flutter/material.dart';

import 'widgets/religious_books_view_body.dart';

class ReligiousBooksView extends StatelessWidget {
  const ReligiousBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ReligiousBooksViewBody(),
        ),
      ),
    );
  }
}
