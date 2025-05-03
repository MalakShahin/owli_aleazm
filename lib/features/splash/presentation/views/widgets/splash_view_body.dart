import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnboarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      "assets/images/splash_img.png",
      fit: BoxFit.fill,
    );
  }

  void navigateToOnboarding() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).push(AppRouter.kOnboardingView);
      },
    );
  }
}
