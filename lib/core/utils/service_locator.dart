



import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/audio_lessons_repo/audio_lessons_repo_impl.dart';
import '../../features/home/data/repos/hadith_repo/hadith_repo_impl.dart';
import '../../features/home/data/repos/khotab_repo/khotab_repo_impl.dart';
import '../../features/home/data/repos/religion_lessons_repo/religion_lessons_repo_impl.dart';
import '../../features/home/data/repos/religious_books_repo/religious_books_repo_impl.dart';
import '../../features/home/data/repos/surah_repo/surah_repo_impl.dart';
import 'api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<SurahRepoImpl>(
    SurahRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HadithRepoImpl>(
    HadithRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ReligiousBooksRepoImpl>(
    ReligiousBooksRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<KhotabRepoImpl>(
    KhotabRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ReligionLessonsRepoImpl>(
    ReligionLessonsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<AudioLessonsRepoImpl>(
    AudioLessonsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
