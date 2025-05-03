import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styels.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../data/models/religious_books.dart';
import '../../manager/religious_books_cubit/religious_books_cubit.dart';
import 'custom_app_bar.dart';

class ReligiousBooksViewBody extends StatelessWidget {
  const ReligiousBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'كتب دينية',
          navBar: true,
        ),
        BlocBuilder<ReligiousBooksCubit, ReligiousBooksState>(
          builder: (context, state) {
            if (state is ReligiousBooksSuccess) {
              final List<ReligiousBooks> religiousBooksList =
                  state.religiousBooksList;
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: religiousBooksList.length,
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: buildBoxDecoration(),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kReligiousBookDetailsView,
                          extra: religiousBooksList[index].id,
                        );
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          '${index + 1}',
                          style: Styles.textStyle16.copyWith(
                            color: AppColor.kWhiteColor,
                          ),
                        ),
                      ),
                      title: Text(
                        '${religiousBooksList[index].title}',
                        style: Styles.textStyle16.copyWith(
                          color: AppColor.kPrimaryColor,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColor.kPrimaryColor,
                        // size: 15,
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is ReligiousBooksFailure) {
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
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
