



import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_color.dart';

class EasyStepperWidget extends StatefulWidget {
  const EasyStepperWidget({super.key});

  @override
  State<EasyStepperWidget> createState() => _EasyStepperWidgetState();
}

class _EasyStepperWidgetState extends State<EasyStepperWidget> {
  int activeStep = 0;
  // Track the current step
  final List<String> stepImages = [
    "assets/images/img.png",
    "assets/images/img_4.png",
    "assets/images/img_5.png",
    "assets/images/img_6.png",
    "assets/images/img_7.png",
  ];

  // Function to build each step
  EasyStep _buildStep(int index) {
    return EasyStep(
      customTitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Center(
          child: Image.asset(
            stepImages[index],
            height: 25,
            width: 25,
            fit: BoxFit.fill,
          ),
        ),
      ),
      customStep: Container(
        decoration: BoxDecoration(
          color: activeStep >= index ? AppColor.kGradientColor : Colors.white,
          border: Border.all(
            color: AppColor.kGradientColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.check,
            color: AppColor.kWhiteColor,
            size: 19,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  EasyStepper(
      activeStepBorderColor: AppColor.kGradientColor,
      activeStepIconColor: AppColor.kWhiteColor,
      activeStep: activeStep,
      internalPadding: 0,
      showLoadingAnimation: false,
      activeStepBackgroundColor: AppColor.kGradientColor,
      lineStyle: const LineStyle(
        lineType: LineType.normal,
        lineThickness: 1.5,
        defaultLineColor: AppColor.kPrimaryColor,
      ),
      stepRadius: 11,
      showStepBorder: false,
      steps: List.generate(
        5, // Number of steps (could be dynamic if needed)
            (index) => _buildStep(index),
      ),
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
