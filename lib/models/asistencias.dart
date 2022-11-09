import 'dart:convert';

List<Asistencias> asistenciasFromJson(String str) => List<Asistencias>.from(json.decode(str).map((x) => Asistencias.fromJson(x)));

String asistenciasToJson(List<Asistencias> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Asistencias {
    Asistencias({
        this.nombreDia,
        this.fecha,
        this.hora,
    });

    String? nombreDia;
    DateTime? fecha;
    String? hora;

    factory Asistencias.fromJson(Map<String, dynamic> json) => Asistencias(
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

// ignore: constant_identifier_names
/*
enum NombreDia { MARTES, LUNES, VIERNES, JUEVES, MIRCOLES }

final nombreDiaValues = EnumValues({
    "Jueves": NombreDia.JUEVES,
    "Lunes": NombreDia.LUNES,
    "Martes": NombreDia.MARTES,
    "Miércoles": NombreDia.MIRCOLES,
    "Viernes": NombreDia.VIERNES
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
        return reverseMap!;
    }
    
}
*/