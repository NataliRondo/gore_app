// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gore_app/data/conexion.dart';
import 'package:gore_app/models/usuario.dart';
//import 'package:gore_app/utils/network_util.dart';
import 'package:http/http.dart' as http;
class loginDA {
  //final NetworkUtil _netUtil = NetworkUtil();
  final LOGIN_URL = "$BASE_URL/login/authenticate";

  Future<Usuario> login(String username, String password, BuildContext context) {
    return http.post(Uri.parse(LOGIN_URL), body: {
      "username": username,
      "password": password,
      "Acceso": API_KEY
    }).then((dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      String hola = "";
      var datos= body["Data"];
      Usuario usuario = Usuario();
      print(hola);
      if (body["Estado"] == "Success") {
        
        usuario = Usuario.fromJson(datos);
      }
      //print("Hola");
      return usuario;
      
    });
  }
}
