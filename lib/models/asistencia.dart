import 'dart:convert';

AsistenciaCalendar asistenciaFromJson(String str) => AsistenciaCalendar.fromJson(json.decode(str));

String asistenciaToJson(AsistenciaCalendar data) => json.encode(data.toJson());

class AsistenciaCalendar {
    AsistenciaCalendar({
        this.day,
        this.entrada,
        this.salida,
    });

    DateTime? day;
    String? entrada;
    String? salida;

    factory AsistenciaCalendar.fromJson(Map<String, dynamic> json) => AsistenciaCalendar(
        day: json["day"],
        entrada: json["entrada"],
        salida: json["salida"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "entrada": entrada,
        "salida": salida,
    };
}

insertar(){
  AsistenciaCalendar(day: DateTime.parse("2022-11-10"), entrada: "12:45", salida: "20:15");
  AsistenciaCalendar(day: DateTime.parse("2022-11-13"), entrada: "12:45", salida: "20:15");
  AsistenciaCalendar(day: DateTime.parse("2022-11-17"), entrada: "12:45", salida: "20:15");
  AsistenciaCalendar(day: DateTime.parse("2022-11-20"), entrada: "12:45", salida: "20:15");
  AsistenciaCalendar(day: DateTime.parse("2022-11-21"), entrada: "12:45", salida: "20:15");
}
