import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher_string.dart';

//void sendEmail(String email) => launchUrlString("mailto:$email");

class TelAndSmsService {
 //void call = Uri.parse('tel:+51 $email');
  //void call(String number) => launch("tel:$number");
  //void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launchUrlString("mailto:$email");
}

GetIt? locator;
void setupLocator() {
  locator!.registerSingleton(TelAndSmsService());
}