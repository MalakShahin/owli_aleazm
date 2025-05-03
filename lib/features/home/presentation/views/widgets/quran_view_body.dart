import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../data/models/surah_number.dart';
import '../../manager/surah_list_cubit/surah_list_cubit.dart';
import 'custom_app_bar.dart';
import 'surah_list_view.dart';

class QuranViewBody extends StatelessWidget {
  const QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'السُورَ',
        ),
        BlocBuilder<SurahListCubit, SurahListState>(
          builder: (context, state) {
            if (state is SurahListSuccess) {
              final List<Surah> surahList = state.surah;
              return SurahsListView(surahList: surahList);
            } else if (state is SurahListFailure) {
              // Handle the failure state
              print('Error: ${state.errMessage}');
              return Center(child: Text('Error: ${state.errMessage}'));
            }
            return const Center(
              heightFactor: 10,
              child: CircularProgressIndicator(
                color: AppColor.kPrimaryColor,
              ),
            );
          },
        ),
      ],
    );
  }
}

