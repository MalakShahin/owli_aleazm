import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/functions/launch_custom_url.dart';
import '../../../../../core/utils/styels.dart';
import '../../../data/models/khotab_model.dart';

class KhotabList extends StatelessWidget {
  const KhotabList({
    super.key,
    required this.khotabList,
  });

  final List<Khotab> khotabList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: khotabList.length,
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
                      khotabList[index].title,
                      style: Styles.textStyle20.copyWith(
                        color: AppColor.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      khotabList[index].description,
                      style: Styles.textStyle18.copyWith(
                        color: AppColor.kGrayTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        launchCustomURL(
                          context,
                          url: khotabList[index].attachments[0].url,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
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
                          'قراءة الخُطبة',
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
      ),
    );
  }
}
