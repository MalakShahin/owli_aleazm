



import 'package:flutter/material.dart';

import '../utils/styels.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $errMessage',
        style: Styles.textStyle18.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
