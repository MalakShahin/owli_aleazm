import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styels.dart';
import 'audio_player_slider.dart';

// Common method for building lesson lists (video or audio)
class LessonList extends StatelessWidget {
  const LessonList(
      {super.key, required this.isAudio, required this.lessonsList});
  final bool isAudio;
  final List<dynamic> lessonsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: lessonsList.length,
          itemBuilder: (context, index) {
            final lesson = lessonsList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: Styles.textStyle20.copyWith(
                          color: AppColor.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        lesson.description ?? "لا يوجد وصف",
                        style: Styles.textStyle18.copyWith(
                          color: AppColor.kGrayTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      if (isAudio) buildAudioPlayerSlider(lesson),
                      if (!isAudio) buildVideoDropdown(lesson, context),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Build the AudioPlayerSlider for audio lessons
  Widget buildAudioPlayerSlider(dynamic lesson) {
    return AudioPlayerSlider(url: lesson.attachments[0].url);
  }

// Build the Dropdown for video lessons
  Widget buildVideoDropdown(dynamic lesson, BuildContext context) {
    final attachments = lesson.attachments;
    if (attachments.isNotEmpty) {
      return DropdownButton<String>(
        menuMaxHeight: 200,
        iconSize: 35,
        isExpanded: true,
        hint: Text(
          'اختر الدرس',
          style: Styles.textStyle16.copyWith(
            color: AppColor.kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        items: attachments.map<DropdownMenuItem<String>>(
          (attachment) {
            return DropdownMenuItem<String>(
              value: attachment.url,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'مشاهدة الدرس ${attachment.order + 1}',
                    style: Styles.textStyle16.copyWith(
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: (url) {
          if (url != null) {
            GoRouter.of(context).push(
              AppRouter.kVideoPlayerView,
              extra: url,
            );
          }
        },
      );
    } else {
      return const Text('No videos available');
    }
  }
}
