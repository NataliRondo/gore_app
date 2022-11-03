import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gore_app/models/UsuarioLite.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

TextStyle fontStyle = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle fontStyleHora = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle fontStyleDependencia = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle fontStyleCumple = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle fontStyleNotificaciones = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white);
TextStyle fontStyleSoporte = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black);
//Color colorFondo = colorFromHex("#004a80");
DateTime fechaActual = DateTime.now();
String strHora = DateFormat('kk:mm:ss').format(fechaActual);
String strFecha = DateFormat('yyyy-MM-dd').format(fechaActual);

var formatters = [
  FilteringTextInputFormatter.deny('.'),
  FilteringTextInputFormatter.deny(','),
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  //FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
  FilteringTextInputFormatter.deny('/'),
  //FilteringTextInputFormatter.allow(RegExp('[0-9]')),
];

Uint8List obtenerFoto(UsuarioLite? usuarioLite) {
   Uint8List bytes = base64.decode(usuarioLite!.foto!.split(',').last);
  return bytes;
}
