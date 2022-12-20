// ignore_for_file: no_logic_in_create_state, must_be_immutable, missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gore_app/push/not.dart';
import 'package:gore_app/view/widgets/notificacion_push.dart';

class PushNotificacion extends StatefulWidget {
  Map<String, dynamic>? notificacion;
  String? noti;
  PushNotificacion({
    Key? key,
    this.notificacion,
    this.noti,
  }) : super(key: key);

  @override
  State<PushNotificacion> createState() => _PushNotificacionState(notificacion, noti);
}

class _PushNotificacionState extends State<PushNotificacion> {
  Map<String, dynamic>? notificacion;
  String? noti;
  Not notificacionNot = Not();
  _PushNotificacionState(this.notificacion, this.noti);
  @override
  Widget build(BuildContext context) {
    notificacion!.remove("custom");
    var encode = jsonEncode(notificacion);
    print("*******************************");
    print(encode);
    Map<String, dynamic> deco = jsonDecode(encode);
    print(deco);
    notificacionNot = Not.fromJson(deco);
    print(notificacionNot);
    var encodeNot = jsonEncode(notificacionNot);
    print(encodeNot);
    print(notificacionNot.alert);

    return Scaffold(
      body: Center(
        child: detallePush(context, notificacionNot.title!,
            notificacionNot.bicon!, notificacionNot.googleSentTime!, "GRLL"),
      ),
    );
  }
}
