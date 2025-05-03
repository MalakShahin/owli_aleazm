import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../data/models/surah_number.dart';

class SurahsListView extends StatelessWidget {
  const SurahsListView({
    super.key,
    required this.surahList,
  });

  final List<Surah> surahList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: surahList.length,
        itemBuilder: (context, index) {
          // final surah = surahList[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kSurahView,
                  extra: surahList[index],
                );
              },
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${surahList[index].number}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                surahList[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPrimaryColor,
                ),
              ),
              subtitle: Text(
                surahList[index].englishName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'عدد الآيات',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${surahList[index].ayahs.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
