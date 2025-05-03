



import 'package:flutter/material.dart';

import 'widgets/khotab_view_body.dart';

class KhotabView extends StatelessWidget {
  const KhotabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: KhotabViewBody(),
        ),
      ),
    );
  }
}
