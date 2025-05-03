import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../data/models/hadith_book.dart';
import '../../manager/hadith_cubit/hadith_cubit.dart';
import 'custom_app_bar.dart';

class HadithViewBody extends StatefulWidget {
  const HadithViewBody({super.key, required this.bookId});
  final String bookId;
  @override
  State<HadithViewBody> createState() => _HadithViewBodyState();
}

class _HadithViewBodyState extends State<HadithViewBody> {
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context).fetchHadith(widget.bookId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: widget.bookId,
        ),
        BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is HadithSuccess) {
              final List<Hadith> hadithList = state.hadithList;
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: hadithList.length,
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5, // Shadow blur
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title: "الحديث"
                          Text(
                            'الحديث ${index + 1}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.kPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            hadithList[index].arab,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is HadithFailure) {
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
