import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle fontStyleNotificaciones = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle fontStyleSoporte = const TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black);
TextStyle style = const TextStyle(fontFamily: 'Lato', fontSize: 14.0);
//Color colorFondo = colorFromHex("#004a80");
DateTime fechaActual = DateTime.now();
String strHora = DateFormat('kk:mm:ss').format(fechaActual);
String strFecha = DateFormat('dd-MM-yyyy').format(fechaActual);

var formatters = [
  FilteringTextInputFormatter.deny('.'),
  FilteringTextInputFormatter.deny(','),
  //FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  //FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
  FilteringTextInputFormatter.deny('/'),
  //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];

DateFormat dateFormat = DateFormat("dd-MM-yyyy");
var colorRandom = Colors.primaries[Random().nextInt(Colors.primaries.length)];
const String oneSignalID = "d597d539-8967-43ab-85ee-4307b60bef58";
