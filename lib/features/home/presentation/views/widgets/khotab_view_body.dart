import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../data/models/khotab_model.dart';
import '../../manager/khotab_cubit/khotab_cubit.dart';
import 'custom_app_bar.dart';
import 'khotab_list.dart';

class KhotabViewBody extends StatelessWidget {
  const KhotabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: "خُطَب",
          navBar: true,
        ),
        const SizedBox(height: 15),
        BlocBuilder<KhotabCubit, KhotabState>(
          builder: (context, state) {
            if (state is KhotabSuccess) {
              final List<Khotab> khotabList = state.khotabList;
              return KhotabList(khotabList: khotabList);
            } else if (state is KhotabFailure) {
              // Handle the failure state
              print('Error: ${state.errMessage}');
              return Center(
                child: Text(
                  'Error: ${state.errMessage}',
                ),
              );
            }
            return const Center(
              heightFactor: 9,
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
