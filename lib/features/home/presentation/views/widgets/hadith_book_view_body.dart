import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../data/models/hadith_book.dart';
import 'custom_app_bar.dart';

class HadithBookViewBody extends StatelessWidget {
  const HadithBookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> bookList = [
      Book(name: "أبو داود", id: "abu-daud", available: 4419, hadiths: []),
      Book(name: "أحمد", id: "ahmad", available: 4305, hadiths: []),
      Book(name: "البخاري", id: "bukhari", available: 6638, hadiths: []),
      Book(name: "الدارمي", id: "darimi", available: 2949, hadiths: []),
      Book(name: "ابن ماجه", id: "ibnu-majah", available: 4285, hadiths: []),
      Book(name: "مالك", id: "malik", available: 1587, hadiths: []),
      Book(name: "مسلم", id: "muslim", available: 4930, hadiths: []),
      Book(name: "النسائي", id: "nasai", available: 5364, hadiths: []),
      Book(name: "الترمذي", id: "tirmidzi", available: 3625, hadiths: []),
    ];

    return Column(
      children: [
        const CustomAppBar(
          title: 'كتب الاحاديث',
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: bookList.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kHadithView,
                    extra: bookList[index].id,
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  bookList[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
                subtitle: Text(
                  bookList[index].id,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'عدد الاحاديث',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '${bookList[index].available}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
