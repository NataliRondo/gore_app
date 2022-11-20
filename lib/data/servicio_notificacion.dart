import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gore_app/data/conexion.dart';
import 'package:gore_app/models/notificacion.dart';

class ServicioNotificacion {
  Future<List<Notificaciones>> getNotificacion(String token) async {
    List<Notificaciones> notificacionLista = [];
    String url = "$BASE_URL/comunicados/listacomunicados";

    await http.post(Uri.parse(url), headers: {'Authorization': token}).then(
        (dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for (var item in data) {
          Notificaciones notificacion = Notificaciones(
            comunicadoId: item["comunicadoID"],
            titulo: item["titulo"],
            descripcion: item["descripcion"],
            fechaInicio: DateTime.parse(item["fechaInicio"]),
            fechaFin: DateTime.parse(item["fechaFin"]),
            prioridad: item["prioridad"],
            registradoPor: item["registradoPor"],
            modificadoPor: item["modificadoPor"],
            fechaRegistro: item["fechaRegistro"]
          );
          notificacionLista.add(notificacion);
        }
      }
    });
    return notificacionLista;
  }
}
