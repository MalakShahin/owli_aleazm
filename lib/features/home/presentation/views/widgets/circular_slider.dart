




import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({super.key});

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      initialValue: _value,
      min: 0,
      max: 100,
      onChange: (double value) {
        setState(() {
          _value = value; // Update the value as the slider changes
        });
      },
      innerWidget: (value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الفجر",
              style: Styles.textStyle16.copyWith(
                color: AppColor.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "04:39 ص",
              style: Styles.textStyle14.copyWith(
                color: AppColor.kGradientColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "04:11:42-",
              style: Styles.textStyle14.copyWith(
                color: AppColor.kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
        // return Center(
        //   child: Text(
        //     value.toStringAsFixed(0),  // Display the value on the slider
        //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //   ),
        // );
      },
      appearance: CircularSliderAppearance(
        customWidths: CustomSliderWidths(
          trackWidth: 7,
          progressBarWidth: 10,
          handlerSize: 13,
        ),
        customColors: CustomSliderColors(
          progressBarColor: AppColor.kGradientColor,
          trackColor: Colors.grey.shade300,
          dotColor: AppColor.kPrimaryColor,
        ),
        size: 120,
        // infoProperties: InfoProperties(
        //   topLabelText: 'Slider',
        //   bottomLabelText: 'Slider Value',
        //   bottomLabelStyle: TextStyle(fontSize: 12, color: Colors.black),
        // ),
      ),
    );
  }
}
