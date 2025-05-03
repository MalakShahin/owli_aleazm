import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../data/models/surah_number.dart';
import '../../manager/quran_progress_cubit/quran_progress_cubit.dart';
import 'custom_app_bar.dart';

class SurahViewBody extends StatefulWidget {
  const SurahViewBody({super.key, required this.surahList});

  final Surah surahList;
  // final int initialAyah;
  @override
  SurahViewBodyState createState() => SurahViewBodyState();
}

class SurahViewBodyState extends State<SurahViewBody> {
  // Variable to track the current Ayah the user stopped at
  int? _currentAyah;

  @override
  void initState() {
    super.initState();
    _loadProgress();
    // _currentAyah = widget.initialAyah;
  }

  // Load the saved progress (if any)
  Future<void> _loadProgress() async {
    final progress = await QuranProgress.loadProgress();
    if (progress != null && progress.surahName == widget.surahList.name) {
      setState(() {
        _currentAyah = progress.ayahNumber; // Set the last saved position
      });
    }
  }

  // Mark the current position of the user
  void _markProgress(int ayahNumber) {
    setState(() {
      _currentAyah = ayahNumber;
    });
    // Save the progress using Cubit
    context.read<QuranProgressCubit>().updateProgress(
          widget.surahList.name,
          ayahNumber,
        );
    // Save the progress
    final progress = QuranProgress(
      surahName: widget.surahList.name,
      ayahNumber: ayahNumber,
    );
    progress.saveProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: widget.surahList.name,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: List.generate(
                  widget.surahList.ayahs.length,
                  (index) {
                    final ayah = widget.surahList.ayahs[index];
                    final isCurrentAyah = _currentAyah == index + 1;

                    // Highlight the Ayah if it is the last read position
                    return TextSpan(
                      text: '${ayah.text} \uFD3F${index + 1}\uFD3E ',
                      style: TextStyle(
                        fontSize: 20,
                        color: isCurrentAyah ? Colors.blue : Colors.black,
                        height: 1.5,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Mark the current Ayah when tapped
                          _markProgress(index + 1);
                        },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
