import 'dart:convert';

Dia diaFromJson(String str) => Dia.fromJson(json.decode(str));

String diaToJson(Dia data) => json.encode(data.toJson());

class Dia {
    Dia({
        this.nombreDia,
        this.fecha,
        this.hora,
    });

    final String? nombreDia;
    final DateTime? fecha;
    final String? hora;

    factory Dia.fromJson(Map<String, dynamic> json) => Dia(
        nombreDia: json["NombreDia"],
        fecha: DateTime.parse(json["Fecha"]),
        hora: json["Hora"],
    );

    Map<String, dynamic> toJson() => {
        "NombreDia": nombreDia,
        "Fecha": "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "Hora": hora,
    };
}
