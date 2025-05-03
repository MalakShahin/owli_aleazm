import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/functions/launch_custom_url.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_back_arrow.dart';
import '../../../data/models/religious_books.dart';
import "../../manager/religious_book_details_cubit/religious_book_details_cubit.dart";

class ReligiousBookDetailsViewBody extends StatefulWidget {
  const ReligiousBookDetailsViewBody({super.key, required this.id});
  final int id;

  @override
  State<ReligiousBookDetailsViewBody> createState() =>
      _ReligiousBookDetailsViewBodyState();
}

class _ReligiousBookDetailsViewBodyState
    extends State<ReligiousBookDetailsViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReligiousBookDetailsCubit>(context)
        .fetchReligiousBooksList(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const CustomBackArrow(),
          const SizedBox(height: 15),
          BlocBuilder<ReligiousBookDetailsCubit, ReligiousBookDetailsState>(
            builder: (context, state) {
              if (state is ReligiousBookDetailsSuccess) {
                final ReligiousBooks religiousBookDetails =
                    state.religiousBookDetails;
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) => Padding(
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
                                '${religiousBookDetails.title}',
                                style: Styles.textStyle20.copyWith(
                                  color: AppColor.kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '${religiousBookDetails.description}',
                                style: Styles.textStyle18.copyWith(
                                  color: AppColor.kGrayTextColor,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  launchCustomURL(
                                    context,
                                    url: '${religiousBookDetails.attachments?[index].url}',
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                  decoration: BoxDecoration(
                                    color: AppColor.kPrimaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.kPrimaryColor.withOpacity(0.2),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'قراءة الكتاب',
                                    style: Styles.textStyle16.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state is ReligiousBookDetailsFailure) {
                // Handle the failure state
                print('Error: ${state.errMessage}');
                return Center(
                  child: Text(
                    'Error: ${state.errMessage}',
                  ),
                );
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
      ),
    );
  }
}
