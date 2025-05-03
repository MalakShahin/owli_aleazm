import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/quran_progress_cubit/quran_progress_cubit.dart';
import 'build_muhafizons_section.dart';
import 'daily_card.dart';
import 'quran_tracking_card%20.dart';

import 'category_list.dart';
import 'easy_stepper_widget.dart';
import 'slider_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranProgressCubit, QuranProgressState>(
      builder: (context, state) {
        String surahName = "No Surah";
        int currentAyah = 1;

        if (state is QuranProgressUpdated) {
          surahName = state.surahName;
          currentAyah = state.ayahNumber;
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const SliderContainer(),
              const SizedBox(height: 10),
              const EasyStepperWidget(),
              const CategoryList(),
              QuranTrackingCard(
                surahName: surahName,
                currentAyah: currentAyah,
                onPressed: () {
                  // if (surahName.isNotEmpty) {
                  //   // Create Surah object dynamically here
                  //   final Surah surah = Surah(
                  //     name: surahName,
                  //     ayahs: [], // Assuming you will load ayahs dynamically
                  //     number: currentAyah,  // This is an example; change as per your logic
                  //     englishName: '',
                  //     englishNameTranslation: '',
                  //     revelationType: '',
                  //   );
                  //
                  //   // Create SurahData object
                  //   final SurahData surahData = SurahData(
                  //     surah: surah,
                  //     initialAyah: currentAyah,  // Pass initialAyah here
                  //   );
                  //   GoRouter.of(context).push(
                  //       AppRouter.kSurahView,
                  //       extra: surahData,
                  //   );
                  // }
                  print(
                      "User pressed follow on $surahName at Ayah $currentAyah");
                },
              ),
              const SizedBox(height: 20),
              const DailyCard(),
              const SizedBox(height: 20),
              const BuildMuhafizonsSection(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
