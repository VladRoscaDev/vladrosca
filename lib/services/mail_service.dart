import 'package:flutter_email_sender/flutter_email_sender.dart';

class MailService {
  static Future<String> send(
      String body, String subject, String recipient) async {
    String platformResponse;

    final Email email = Email(
        body: body, subject: subject, recipients: [recipient], isHTML: true);

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      return platformResponse;
    } catch (error) {
      platformResponse = error.toString();
      return platformResponse;
    }
  }
}
