



import 'package:flutter/material.dart';

import '../../data/models/religious_books.dart';
import 'widgets/religious_book_details_view_body.dart';

class ReligiousBookDetailsView extends StatelessWidget {
  const ReligiousBookDetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ReligiousBookDetailsViewBody(id: id),
        ),
      ),
    );
  }
}
