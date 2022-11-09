import 'dart:convert';

import 'package:gore_app/data/conexion.dart';
import 'package:gore_app/models/asistencias.dart';
import 'package:gore_app/models/dia.dart';
import 'package:http/http.dart' as http;

class ServicioAsistencia{

  Future <List<Asistencias>> getAsistencias(String dni, String token, DateTime day) async {
    List<Asistencias> asistenciaLista = [];
    String url = "$BASE_URL/asistencia/ObtenerMarcaciones?dni=$dni";

    await http.post(Uri.parse(url), headers: {
      'Authorization': token
    }).then((dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for(var item in data){
          Asistencias asistencia = Asistencias(
           /// DateTime.parse(json["Fecha"]);
            nombreDia: item["NombreDia"],
            fecha: DateTime.parse(item["Fecha"]),
            hora: item["Hora"]
          );
          asistenciaLista.add(asistencia);
        }

      }
    });
    return asistenciaLista;
  }

  /*Future<List<Asistencias>> getByDay(String dni, String token, DateTime day) async{
    try {
      var nextDay = day.add(Duration(days: 1));
      var snapshop = await getAsistencias(dni, token, day);
      List<Asistencias> asistencias = [];
      
    } catch (e) {
      
    }
  }*/

  Future <Dia> getAsistenciaDia(String dni, String token, DateTime day) async {
    List<Dia> diaLista = [];
    String url = "$BASE_URL/asistencia/ObtenerMarcaciones?dni=$dni";
    Dia? dia;

    await http.post(Uri.parse(url), headers: {
      'Authorization': token
    }).then((dynamic res) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> data = body["Data"];
      if (body["Estado"] == "Success") {
        for(var item in data){
          dia = Dia(
           /// DateTime.parse(json["Fecha"]);
            nombreDia: item["NombreDia"],
            fecha: DateTime.parse(item["Fecha"]),
            hora: item["Hora"]
          );
          diaLista.add(dia!);
        }
        if( dia!.fecha == day){
          //asistenciaWidget(asistencia!.nombreDia!, asistencia!.hora!, asistencia!.fecha!);
          print(dia!.nombreDia!);
          print(dia!.hora!);
          print(dia!.fecha!);
        }
      }
    });
    return dia!;
  }
}