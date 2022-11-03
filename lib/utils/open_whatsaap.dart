// ignore_for_file: deprecated_member_use, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

openwhatsapp(
    BuildContext context, String numeroWhatsapp, String mensaje) async {
  //var whatsapp ="+51992023978";
  var whatsappURlAndroid =
      "whatsapp://send?phone=+51$numeroWhatsapp&text=$mensaje";
  var whatappURLIos =
      "https://wa.me/$numeroWhatsapp?text=${Uri.parse("Soporte")}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatappURLIos)) {
      await launch(whatappURLIos, forceSafariVC: false);
    } else {
      context;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("whatsapp no instalado")));
    }
  } else {
    // android , web
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      _showMyDialog(context);
    }
  }
}
Future _showMyDialog(
  BuildContext context,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('No encuentra Whatsapp')),
        content: SingleChildScrollView(
          child: ListBody(
            children:const[
               Center(child: Text('Instale Whatsapp o verifique que no tenga activado dual app (Whatsapp)')),
            ],
          ),
        ),
        actions:[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}