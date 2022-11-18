import 'dart:convert';
import 'package:gore_app/models/cumpleanios_dia.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:http/http.dart' as http;
import 'package:gore_app/data/conexion.dart';
import 'package:gore_app/models/trabajador.dart';
import 'package:intl/intl.dart';

class ServicioCumpleanio {
  Future<List<Trabajador>> getCumpleanio(String token) async {
    List<Trabajador> trabajadorLista = [];
    String url = "$BASE_URL/cumpleanos/ListaCumpleanos";

    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          Trabajador trabajador = Trabajador(
              vPerNombre: item["vPerNombre"],
              vPerApellidoM: item["vPerApellidoM"],
              vPerApellidoP: item["vPerApellidoP"],
              dni: item["Dni"],
              fechaNacimiento: DateTime.parse(item["FechaNacimiento"]),
              foto: item["Foto"]);
          //mesdia = fechaActual.day;
          var hoyDiaMes = DateFormat('MM-dd').format(fechaActual);
          var fechaTrabajador =
              DateFormat('MM-dd').format(trabajador.fechaNacimiento!);
          if (fechaTrabajador.compareTo(hoyDiaMes) == 0) {
            print("Son iguales, $hoyDiaMes y $fechaTrabajador");
          } else {
            if (fechaTrabajador.compareTo(hoyDiaMes) < 0) {
              print("Es el día anterior, $hoyDiaMes y $fechaTrabajador");
            } else {
              print("Es el día después, $hoyDiaMes y $fechaTrabajador");
            }
          }
          trabajadorLista.add(trabajador);
        }
      }
    });
    return trabajadorLista;
  }

  Future<List<CumpleanioDia>> getCumpleanioDia(String token, Trabajador trabajador) async {
    List<CumpleanioDia> cumpleanioLista = [];
    var cumpleTrabajador = trabajador.fechaNacimiento;
    DateFormat('MM-dd').format(cumpleTrabajador!);
    String url = "$BASE_URL/cumpleanos/ListaCumpleanos";
    var hoyDiaMes = DateFormat('MM-dd').format(fechaActual);
    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          CumpleanioDia trabajador = CumpleanioDia(
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
          //mesdia = fechaActual.day;

          /*var fechaTrabajador =
              DateFormat('MM-dd').format(trabajador.fechaNacimiento!);
          if (fechaTrabajador.compareTo(hoyDiaMes) == 0) {
            print("Son iguales, $hoyDiaMes y $fechaTrabajador");
          } else {
            if (fechaTrabajador.compareTo(hoyDiaMes) < 0) {
              print("Es el día anterior, $hoyDiaMes y $fechaTrabajador");
            } else {
              print("Es el día después, $hoyDiaMes y $fechaTrabajador");
            }
          }*/
          cumpleanioLista.add(trabajador);
        }
      }
    });
    return cumpleanioLista;
  }
}
