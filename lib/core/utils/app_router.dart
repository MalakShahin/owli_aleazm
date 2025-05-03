import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/forget_pass_view.dart';
import '../../features/auth/presentation/views/sign_in_sign_up_view.dart';
import '../../features/auth/presentation/views/verification_code_view.dart';
import '../../features/home/data/models/religious_books.dart';
import '../../features/home/data/models/surah_number.dart';
import '../../features/home/presentation/views/hadith_Book_view.dart';
import '../../features/home/presentation/views/hadith_view.dart';
import '../../features/home/presentation/views/hijri_calendar_view.dart';
import '../../features/home/presentation/views/my_home_view.dart';
import '../../features/home/presentation/views/quran_view.dart';
import '../../features/home/presentation/views/religion_lessons_view.dart';
import '../../features/home/presentation/views/religious_book_details_view.dart';
import '../../features/home/presentation/views/surah_view.dart';
import '../../features/home/presentation/views/video_player_view.dart';
import '../../features/splash/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  // SignInSignUpView;ReligionLessonsView HadithView
  static const kOnboardingView = '/OnboardingView';
  static const kSignInSignUpView = '/SignInSignUpView';
  static const kForgetPassView = '/ForgetPassView';
  static const kVerificationCodeView = '/VerificationCodeView';
  static const kMyHomeView = '/MyHomeView';
  static const kQuranView = '/QuranView';
  static const kSurahView = '/SurahView';
  static const kHadithBookView = '/HadithBookView';
  static const kHadithView = '/HadithView';
  static const kReligiousBookDetailsView = '/ReligiousBookDetailsView';
  static const kHijriCalendarView = '/HijriCalendarView';
  static const kReligionLessonsView = '/ReligionLessonsView';
  static const kVideoPlayerView = '/VideoPlayerView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView();
        },
      ),

      GoRoute(
        path: kSignInSignUpView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInSignUpView();
        },
      ),
      GoRoute(
        path: kForgetPassView,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetPassView();
        },
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (BuildContext context, GoRouterState state) {
          return const VerificationCodeView();
        },
      ),
      GoRoute(
        path: kMyHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomeView();
        },
      ),
      GoRoute(
        path: kQuranView,
        builder: (BuildContext context, GoRouterState state) {
          return const QuranView();
        },
      ),
      GoRoute(
        path: kSurahView,
        builder: (BuildContext context, GoRouterState state) {
          // final SurahData data =  state.extra as SurahData;
          return SurahView(
            // surahList: data.surah,
             surahList: state.extra as Surah,
            // /initialAyah: data.initialAyah,
          );
        },
      ),
      GoRoute(
        path: kHadithBookView,
        builder: (BuildContext context, GoRouterState state) {
          return const HadithBookView();
        },
      ),
      GoRoute(
        path: kHadithView,
        builder: (BuildContext context, GoRouterState state) {
          return HadithView(
            bookId: state.extra as String,
          );
        },
      ),
      GoRoute(
        path: kReligiousBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return ReligiousBookDetailsView(
            id: state.extra as int,
          );
        },
      ),
      GoRoute(
        path: kHijriCalendarView,
        builder: (BuildContext context, GoRouterState state) {
          return const HijriCalendarView();
        },
      ),
      GoRoute(
        path: kReligionLessonsView,
        builder: (BuildContext context, GoRouterState state) {
          return const ReligionLessonsView();
        },
      ),
      GoRoute(
        path: kVideoPlayerView,
        builder: (BuildContext context, GoRouterState state) {
          return VideoPlayerView(
            url: state.extra as String,
          );
        },
      ),
      // GoRoute(
      //   path: '/BookDetailsView',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return BlocProvider(
      //       create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
      //       child: BookDetailsView(
      //         bookModel: state.extra as Items,
      //       ),
      //     );
      //   },
      // ),

      // ),
    ],
  );
}
