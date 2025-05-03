import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/app_color.dart';

class PinInputSection extends StatelessWidget {
  const PinInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.red),
      ),
    );

    return Align(
      alignment: Alignment.center,
      child: Pinput(
        closeKeyboardWhenCompleted: true,
        length: 6,
        keyboardType: TextInputType.number,
        separatorBuilder: (index) => const SizedBox(width: 8),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: AppColor.kPrimaryColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

// Align(
//   alignment: Alignment.center,
//   child: Pinput(
//     closeKeyboardWhenCompleted: true,
//     length: 6,
//     keyboardType: TextInputType.number,
//     separatorBuilder: (index) => const SizedBox(width: 8),
//     // validator: (value) {
//     //   return value == '2222' ? null : 'Pin is incorrect';
//     // },
//     hapticFeedbackType: HapticFeedbackType.lightImpact,
//     onCompleted: (pin) {
//       debugPrint('onCompleted: $pin');
//     },
//     onChanged: (value) {
//       debugPrint('onChanged: $value');
//     },
//     cursor: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(bottom: 9),
//           width: 22,
//           height: 1,
//           color: AppColor.kPrimaryColor,
//         ),
//       ],
//     ),
//     focusedPinTheme: defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration!.copyWith(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: AppColor.kPrimaryColor),
//       ),
//     ),
//     // submittedPinTheme: defaultPinTheme.copyWith(
//     //   decoration: defaultPinTheme.decoration!.copyWith(
//     //     color: fillColor,
//     //     borderRadius: BorderRadius.circular(19),
//     //     border: Border.all(color: focusedBorderColor),
//     //   ),
//     // ),
//     // errorPinTheme: defaultPinTheme.copyBorderWith(
//     //   border: Border.all(color: Colors.redAccent),
//     // ),
//   ),
// ),
