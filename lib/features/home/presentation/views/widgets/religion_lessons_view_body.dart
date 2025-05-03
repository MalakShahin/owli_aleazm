import 'package:flutter/material.dart';
import '../../../../../core/widgets/tab_bar_title.dart';
import 'audio_lessons.dart';
import 'custom_app_bar.dart';
import 'video_lessons.dart';

class ReligionLessonsViewBody extends StatefulWidget {
  const ReligionLessonsViewBody({super.key});

  @override
  State<ReligionLessonsViewBody> createState() =>
      _ReligionLessonsViewBodyState();
}

class _ReligionLessonsViewBodyState extends State<ReligionLessonsViewBody> {
  bool textTwo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: "دروس دين"),
        const SizedBox(height: 25),
        TabBarTitle(
          textOne: "مشاهدة",
          textTwo: "استماع",
          isSignIn: textTwo,
          onTabChanged: (bool newValue) {
            if (mounted) {
              setState(() {
                textTwo = newValue;
              });
            }
          },
        ),
        if (!textTwo) const VideoLessonsSection(),
        if (textTwo) const AudioLessons(),
      ],
    );
  }
}
// class ReligionLessonsViewBody extends StatefulWidget {
//   const ReligionLessonsViewBody({super.key});
//
//   @override
//   State<ReligionLessonsViewBody> createState() =>
//       _ReligionLessonsViewBodyState();
// }
//
// class _ReligionLessonsViewBodyState extends State<ReligionLessonsViewBody> {
//   bool textTwo = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const CustomAppBar(title: "دروس دين"),
//         const SizedBox(height: 25),
//         TabBarTitle(
//           textOne: "مشاهدة",
//           textTwo: "استماع",
//           isSignIn: textTwo,
//           onTabChanged: (bool newValue) {
//             setState(() {
//               textTwo = newValue;
//             });
//           },
//         ),
//         // const SizedBox(height: 25),
//         if (textTwo == false)
//           BlocBuilder<ReligionLessonsCubit, ReligionLessonsState>(
//             builder: (context, state) {
//               if (state is ReligionLessonsSuccess) {
//                 final List<VideoItem> lessonsList = state.lessonsList;
//                 return Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: lessonsList.length,
//                       itemBuilder: (context, index) {
//                         final videoItem = lessonsList[index];
//                         final attachments = videoItem.attachments;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     lessonsList[index].title,
//                                     style: Styles.textStyle20.copyWith(
//                                       color: AppColor.kPrimaryColor,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 22,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 15),
//                                   Text(
//                                     lessonsList[index].description ??
//                                         "لا يوجد وصف",
//                                     style: Styles.textStyle18.copyWith(
//                                       color: AppColor.kGrayTextColor,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                   const SizedBox(height: 20),
//                                   if (attachments.isNotEmpty) ...[
//                                     // Dropdown for lesson selection
//                                     DropdownButton<String>(
//                                       menuMaxHeight: 200,
//                                       iconSize: 35,
//                                       isExpanded: true,
//                                       hint: Text(
//                                         'اختر الدرس',
//                                         style: Styles.textStyle16.copyWith(
//                                           color: AppColor.kPrimaryColor,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       items: attachments
//                                           .map<DropdownMenuItem<String>>(
//                                         (attachment) {
//                                           return DropdownMenuItem<String>(
//                                             value: attachment.url,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 Text(
//                                                   'مشاهدة الدرس ${attachment.order + 1}',
//                                                   style: Styles.textStyle16
//                                                       .copyWith(
//                                                     color:
//                                                         AppColor.kPrimaryColor,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ).toList(),
//                                       onChanged: (url) {
//                                         if (url != null) {
//                                           GoRouter.of(context).push(
//                                             AppRouter.kVideoPlayerView,
//                                             extra: url,
//                                           );
//                                         }
//                                       },
//                                     ),
//                                   ] else ...[
//                                     const Text('No videos available'),
//                                   ],
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               } else if (state is ReligionLessonsFailure) {
//                 // Handle the failure state
//                 print('Error: ${state.errMessage}');
//                 return Center(
//                   child: Text(
//                     'Error: ${state.errMessage}',
//                   ),
//                 );
//               }
//               return const Center(
//                 heightFactor: 9,
//                 child: CircularProgressIndicator(
//                   color: AppColor.kPrimaryColor,
//                 ),
//               );
//             },
//           ),
//         if (textTwo == true)
//           BlocBuilder<AudioLessonsCubit, AudioLessonsState>(
//             builder: (context, state) {
//               if (state is AudioLessonsSuccess) {
//                 final List<AudioItem> audioList = state.audioLessonsList;
//                 return Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: audioList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     audioList[index].title,
//                                     style: Styles.textStyle20.copyWith(
//                                       color: AppColor.kPrimaryColor,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 22,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 15),
//                                   Text(
//                                     audioList[index].description,
//                                     style: Styles.textStyle18.copyWith(
//                                       color: AppColor.kGrayTextColor,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     textAlign: TextAlign.start,
//                                     maxLines: 3,
//                                   ),
//                                   const SizedBox(height: 20),
//                                   AudioPlayerSlider(
//                                     url: audioList[index].attachments[0].url,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               } else if (state is AudioLessonsFailure) {
//                 print('Error: ${state.errMessage}');
//                 return Center(
//                   child: Text(
//                     'Error: ${state.errMessage}',
//                   ),
//                 );
//               }
//               return const Center(
//                 heightFactor: 9,
//                 child: CircularProgressIndicator(
//                   color: AppColor.kPrimaryColor,
//                 ),
//               );
//             },
//           ),
//       ],
//     );
//   }
// }
//
