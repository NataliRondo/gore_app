import 'dart:convert';

import 'package:gore_app/data/conexion.dart';
import 'package:gore_app/models/asistencias.dart';
import 'package:http/http.dart' as http;

class ServicioAsistencia {
  Future<List<Asistencias>> getAsistencias(
      String dni, String token,) async {
    List<Asistencias> asistenciaLista = [];
    String url = "$BASE_URL/asistencia/ObtenerMarcaciones?dni=$dni";

    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          Asistencias asistencia = Asistencias(
              nombreDia: item["NombreDia"],
              fecha: DateTime.parse(item["Fecha"]),
              hora: item["Hora"]);
          asistenciaLista.add(asistencia);
        }
      }
    });
    return asistenciaLista;
  }

  Future<List<Asistencias>> getAsistenciasDia(
      String dni, String token, String day) async {
        //print(day);
    List<Asistencias> asistenciaLista = [];
    String url = "$BASE_URL/asistencia/ObtenerMarcacion?dni=$dni&fecha=$day";

    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          Asistencias asistencia = Asistencias(
              nombreDia: item["NombreDia"],
              fecha: DateTime.parse(item["Fecha"]),
              hora: item["Hora"]);
          asistenciaLista.add(asistencia);
        }
      }
    });
    return asistenciaLista;
  }
}
