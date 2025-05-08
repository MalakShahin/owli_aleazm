import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/manager/signin_signup_cubit/signin_sinup_cubit.dart';
import 'features/home/data/repos/audio_lessons_repo/audio_lessons_repo_impl.dart';
import 'features/home/data/repos/hadith_repo/hadith_repo_impl.dart';
import 'features/home/data/repos/khotab_repo/khotab_repo_impl.dart';
import 'features/home/data/repos/religion_lessons_repo/religion_lessons_repo_impl.dart';
import 'features/home/data/repos/religious_books_repo/religious_books_repo_impl.dart';
import 'features/home/data/repos/surah_repo/surah_repo_impl.dart';
import 'features/home/presentation/manager/audio_lessons_cubit/audio_lessons_cubit.dart';
import 'features/home/presentation/manager/hadith_book_cubit/hadith_book_cubit.dart';
import 'features/home/presentation/manager/hadith_cubit/hadith_cubit.dart';
import 'features/home/presentation/manager/khotab_cubit/khotab_cubit.dart';
import 'features/home/presentation/manager/quran_progress_cubit/quran_progress_cubit.dart';
import 'features/home/presentation/manager/religion_lessons_cubit/religion_lessons_cubit.dart';
import 'features/home/presentation/manager/religious_book_details_cubit/religious_book_details_cubit.dart';
import 'features/home/presentation/manager/religious_books_cubit/religious_books_cubit.dart';
import 'features/home/presentation/manager/surah_list_cubit/surah_list_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninSignupCubit()),
        BlocProvider(
          create: (context) => SurahListCubit(
            getIt.get<SurahRepoImpl>(),
          )..fetchSurahList(),
        ),
        BlocProvider(
          create: (context) => HadithBookCubit(
            getIt.get<HadithRepoImpl>(),
          )..fetchHadithBook(),
        ),
        BlocProvider(
          create: (context) => HadithCubit(
            getIt.get<HadithRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => ReligiousBooksCubit(
            getIt.get<ReligiousBooksRepoImpl>(),
          )..fetchReligiousBooksList(),
        ),
        BlocProvider(
          create: (context) => ReligiousBookDetailsCubit(
            getIt.get<ReligiousBooksRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => KhotabCubit(
            getIt.get<KhotabRepoImpl>(),
          )..fetchKhotabList(),
        ),
        BlocProvider(
          create: (context) => ReligionLessonsCubit(
            getIt.get<ReligionLessonsRepoImpl>(),
          )..fetchLessonsList(),
        ),
        BlocProvider(
          create: (context) => AudioLessonsCubit(
            getIt.get<AudioLessonsRepoImpl>(),
          )..fetchLessonsList(),
        ),
        BlocProvider(
          create: (context) => QuranProgressCubit()..loadProgress(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: GoogleFonts.montserratTextTheme.toString(),
        ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
