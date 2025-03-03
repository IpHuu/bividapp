import 'package:url_launcher/url_launcher.dart';

Future<void> dialCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> mailTo(String email, String subject) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=$subject',
  );
  await launchUrl(launchUri);
}

bool checkIfImage(String param) {
  if (param == 'image/jpeg' || param == 'image/png' || param == 'image/gif') {
    return true;
  }
  return false;
}
