import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/styels.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLiens = 1,
    this.onChanged,
    this.onSaved,
    this.obscureText = false,
    this.keyboardType, this.validator,
  });

  final String hint;
  final int maxLiens;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      //     (value) {
      //   return null;
      //   // if(value?.isEmpty ?? true){
      //   //   return 'Field is Required';
      //   // }else{
      //   //   return null;
      //   // }
      // },
      maxLines: maxLiens,
      cursorColor: AppColor.kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Styles.textStyle14,
        border: buildOutlineInputBorder(AppColor.kGrayTextColor),
        enabledBorder: buildOutlineInputBorder(AppColor.kGrayTextColor),
        focusedBorder: buildOutlineInputBorder(AppColor.kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}

// class InputFormField extends StatefulWidget {
//   const InputFormField({
//     super.key,
//     this.hintText,
//     this.onChanged,
//     this.validator,
//     this.borderColor,
//     this.labelText,
//     this.secure = false,
//     this.verticalMargin = 0,
//     this.horizontalMargin = 0,
//     this.keyboardType,
//   });
//
//   final String? hintText;
//   final String? labelText;
//   final void Function(String)? onChanged;
//   final String? Function(String?)? validator;
//   final Color? borderColor;
//   final bool secure;
//   final double verticalMargin;
//   final double horizontalMargin;
//   final TextInputType? keyboardType;
//
//   @override
//   State<InputFormField> createState() => _InputFormFieldState();
// }
//
// class _InputFormFieldState extends State<InputFormField> {
//
//   late bool secure;
//
//   @override
//   void initState() {
//     secure = widget.secure;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: widget.verticalMargin,
//         horizontal: widget.horizontalMargin,
//       ),
//       child: TextFormField(
//         // cursorColor: ,
//         obscureText: secure,
//         keyboardType: widget.keyboardType,
//         decoration: InputDecoration(
//           label: Text(widget.labelText ?? ''),
//           hintText: widget.hintText,
//           suffixIcon: !widget.secure ? const SizedBox() : IconButton(
//             icon: const Icon(
//               Icons.remove_red_eye,
//               // color: secure ? kDarkGrayColor : kGrayColor.withOpacity(0.5),
//             ),
//             onPressed: () {
//               secure = !secure;
//               setState(() {});
//             },
//           ),
//            enabledBorder: _getBorder(
//              Colors.grey
//            ),
//            focusedBorder: _getBorder(Colors.grey),
//           errorBorder: _getBorder(Colors.red),
//            focusedErrorBorder: _getBorder(Colors.red.shade900),
//         ),
//         onChanged: widget.onChanged,
//         validator: widget.validator,
//       ),
//     );
//   }
//
//   InputBorder _getBorder(Color color) {
//     return UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: color,
//       ),
//     );
//   }
// }
