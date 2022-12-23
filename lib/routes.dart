// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:gore_app/view/loginView.dart';
import 'package:gore_app/view/pantalla_principal.dart';

final routes ={
  '/login': (BuildContext context) =>   LoginView(),
  '/home': (BuildContext context) =>  PantallaInicio(),
};