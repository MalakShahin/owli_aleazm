import 'package:flutter/material.dart';

import 'onboarding_page_indicator.dart';
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void nextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          OnboardingPageView(
            onTap: nextPage,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 50,
            right: MediaQuery.of(context).size.width / 2.6,
            child: OnboardingPageIndicator(controller: _controller),
          ),
        ],
      ),
    );
  }
}

