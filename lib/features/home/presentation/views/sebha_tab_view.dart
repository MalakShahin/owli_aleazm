



import 'package:flutter/material.dart';

import 'widgets/sebha_tab_view_body.dart';

class SebhaTabView extends StatelessWidget {
  const SebhaTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SebhaTabViewBody(),
        ),
      ),
    );
  }
}
