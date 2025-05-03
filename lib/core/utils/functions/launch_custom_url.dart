
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<void> launchCustomURL(context, {required String url}) async {
//   try {
//     Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(
//         uri,
//         mode: LaunchMode.externalApplication,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//
//         content: Text('Can\'t launch $url'),
//       ));
//     }
//   } catch (e) {
//     print('Error launching URL: $e');
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Failed to launch $url. Error: $e'),
//     ));
//   }
// }




Future<void> launchCustomURL(BuildContext context, {required String url}) async {
  try {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Can\'t launch $url'),
      ));
    }
  } catch (e) {
    print('Error launching URL: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Failed to launch $url. Error: $e'),
    ));
  }
}