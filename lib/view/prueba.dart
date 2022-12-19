// ignore_for_file: no_logic_in_create_state, must_be_immutable, missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gore_app/push/not.dart';

class Prueba extends StatefulWidget {
  Map<String, dynamic>? notificacion;
  String? noti;
  Prueba({Key? key, this.notificacion, this.noti,})
      : super(key: key);

  @override
  State<Prueba> createState() =>
      _PruebaState(notificacion, noti);
}

class _PruebaState extends State<Prueba> {
  Map<String, dynamic>? notificacion;
  String? noti;
  Not notificacionNot = Not();
  _PruebaState(this.notificacion, this.noti);
  @override
  Widget build(BuildContext context) {
    notificacion!.remove("custom");
    var encode = jsonEncode(notificacion);
    print("*******************************");
    print(encode);
    Map<String, dynamic> deco = jsonDecode(encode);
    print(deco);
    notificacionNot= Not.fromJson(deco);
    print(notificacionNot);
    var encodeNot = jsonEncode(notificacionNot);
    print(encodeNot);
    print(notificacionNot.alert);
    
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [Center(child: Text(noti!))],
        ),
      )),
    );
  }
}
