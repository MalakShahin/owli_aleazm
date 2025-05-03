import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/input_form_fild.dart';

class FormItem extends StatelessWidget {
  const FormItem({
    super.key,
    this.maxLiens = 1,
    this.onChanged,
    this.onSaved,
    this.obscureText = false,
    this.keyboardType,
    required this.text,
    required this.hint, this.validator,
  });
  final String text;
  final String hint;
  final int maxLiens;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: AppColor.kBlackColor,
          ),
        ),
        const SizedBox(height: 5),
        CustomTextFormField(
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          obscureText: obscureText,
          keyboardType: keyboardType,
          hint: hint,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
