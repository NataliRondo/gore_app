import 'dart:convert';
import 'package:gore_app/models/cumpleanios_dia.dart';
import 'package:gore_app/models/cumpleanios_diaA.dart';
import 'package:gore_app/models/cumpleanios_diaH.dart';
import 'package:gore_app/models/cumpleanios_diaM.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:http/http.dart' as http;
import 'package:gore_app/data/conexion.dart';
import 'package:intl/intl.dart';

class ServicioCumpleanio {
  
  Future<List<CumpleanioDiaH>> getCumpleanioDiaHoy(String token) async {
    List<CumpleanioDiaH> cumpleanioLista = [];
    CumpleanioDiaH cumpleanioDiaH = CumpleanioDiaH();
    String url = "$BASE_URL/cumpleanos/ListaCumpleanos";
    var hoyDiaMes = DateFormat('MM-dd').format(fechaActual);
    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          CumpleanioDia cumpleanio = CumpleanioDia(
              dia: DateFormat('MM-dd')
                          .format(DateTime.parse(item["FechaNacimiento"]))
                          .compareTo(hoyDiaMes) ==
                      0
                  ? "Hoy"
                  : DateFormat('MM-dd')
                              .format(DateTime.parse(item["FechaNacimiento"]))
                              .compareTo(hoyDiaMes) <
                          0
                      ? "Ayer"
                      : "Mañana",
              vPerNombre: item["vPerNombre"],
              vPerApellidoM: item["vPerApellidoM"],
              vPerApellidoP: item["vPerApellidoP"],
              dni: item["Dni"],
              fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
              foto: item["Foto"]);

          if (cumpleanio.dia == "Hoy") {
            cumpleanioDiaH = CumpleanioDiaH(
                dia: "Hoy",
                vPerNombre: item["vPerNombre"],
                vPerApellidoM: item["vPerApellidoM"],
                vPerApellidoP: item["vPerApellidoP"],
                dni: item["Dni"],
                fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
                foto: item["Foto"]);
            cumpleanioLista.add(cumpleanioDiaH);
          }
        }
      }
    });
    return cumpleanioLista;
  }

  Future<List<CumpleanioDiaA>> getCumpleanioDiaAyer(String token) async {
    List<CumpleanioDiaA> cumpleanioLista = [];
    CumpleanioDiaA cumpleanioDiaA = CumpleanioDiaA();
    String url = "$BASE_URL/cumpleanos/ListaCumpleanos";
    var hoyDiaMes = DateFormat('MM-dd').format(fechaActual);
    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          CumpleanioDia cumpleanio = CumpleanioDia(
              dia: DateFormat('MM-dd')
                          .format(DateTime.parse(item["FechaNacimiento"]))
                          .compareTo(hoyDiaMes) ==
                      0
                  ? "Hoy"
                  : DateFormat('MM-dd')
                              .format(DateTime.parse(item["FechaNacimiento"]))
                              .compareTo(hoyDiaMes) <
                          0
                      ? "Ayer"
                      : "Mañana",
              vPerNombre: item["vPerNombre"],
              vPerApellidoM: item["vPerApellidoM"],
              vPerApellidoP: item["vPerApellidoP"],
              dni: item["Dni"],
              fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
              foto: item["Foto"]);

          if (cumpleanio.dia == "Ayer") {
            cumpleanioDiaA = CumpleanioDiaA(
                dia: "Hoy",
                vPerNombre: item["vPerNombre"],
                vPerApellidoM: item["vPerApellidoM"],
                vPerApellidoP: item["vPerApellidoP"],
                dni: item["Dni"],
                fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
                foto: item["Foto"]);
            cumpleanioLista.add(cumpleanioDiaA);
          }
        }
      }
    });
    return cumpleanioLista;
  }

  Future<List<CumpleanioDiaM>> getCumpleanioDiaManana(String token) async {
    List<CumpleanioDiaM> cumpleanioLista = [];
    CumpleanioDiaM cumpleanioDiaM = CumpleanioDiaM();
    String url = "$BASE_URL/cumpleanos/ListaCumpleanos";
    var hoyDiaMes = DateFormat('MM-dd').format(fechaActual);
    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          CumpleanioDia cumpleanio = CumpleanioDia(
              dia: DateFormat('MM-dd')
                          .format(DateTime.parse(item["FechaNacimiento"]))
                          .compareTo(hoyDiaMes) ==
                      0
                  ? "Hoy"
                  : DateFormat('MM-dd')
                              .format(DateTime.parse(item["FechaNacimiento"]))
                              .compareTo(hoyDiaMes) <
                          0
                      ? "Ayer"
                      : "Mañana",
              vPerNombre: item["vPerNombre"],
              vPerApellidoM: item["vPerApellidoM"],
              vPerApellidoP: item["vPerApellidoP"],
              dni: item["Dni"],
              fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
              foto: item["Foto"]);

          if (cumpleanio.dia == "Mañana") {
            cumpleanioDiaM = CumpleanioDiaM(
                dia: "Hoy",
                vPerNombre: item["vPerNombre"],
                vPerApellidoM: item["vPerApellidoM"],
                vPerApellidoP: item["vPerApellidoP"],
                dni: item["Dni"],
                fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
                foto: item["Foto"]);
            cumpleanioLista.add(cumpleanioDiaM);
          }
        }
      }
    });
    return cumpleanioLista;
  }
}
