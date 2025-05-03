import 'package:flutter/material.dart';
import '../../data/models/surah_number.dart';
import 'widgets/surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({
    super.key,
    required this.surahList,
    // required this.initialAyah,
  });
  final Surah surahList;
  // final int initialAyah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SurahViewBody(
            surahList: surahList,
            // initialAyah: initialAyah,
          ),
        ),
      ),
    );
  }
}

class SurahData {
  final Surah surah;
  final int initialAyah;

  SurahData({required this.surah, required this.initialAyah});
}
