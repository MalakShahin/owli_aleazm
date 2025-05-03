


import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      heightFactor: 9,
      child: CircularProgressIndicator(
        color: AppColor.kPrimaryColor,
      ),
    );
  }
}
