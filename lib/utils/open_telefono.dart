import 'package:url_launcher/url_launcher.dart';

Future<void> openTelefono(String? celular) async {
  final call = Uri.parse('tel: $celular');
  if (await canLaunchUrl(call)) {
    launchUrl(call);
  } else {
    throw 'Could not launch $call';
  }
}