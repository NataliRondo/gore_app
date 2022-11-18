// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<Trabajador> trabajadorFromJson(String str) => List<Trabajador>.from(json.decode(str).map((x) => Trabajador.fromJson(x)));

String trabajadorToJson(List<Trabajador> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trabajador {
    Trabajador({
        this.vPerNombre,
        this.vPerApellidoP,
        this.vPerApellidoM,
        this.dni,
        this.fechaNacimiento,
        this.foto,
    });

    String? vPerNombre;
    String? vPerApellidoP;
    String? vPerApellidoM;
    String? dni;
    DateTime? fechaNacimiento;
    String? foto;

    factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        vPerNombre: json["vPerNombre"],
        vPerApellidoP: json["vPerApellidoP"],
        vPerApellidoM: json["vPerApellidoM"],
        dni: json["Dni"],
        fechaNacimiento: DateTime.parse(json["FechaNacimiento"]),
        foto: json["Foto"] == null ? null : json["Foto"],
    );

    Map<String, dynamic> toJson() => {
        "vPerNombre": vPerNombre,
        "vPerApellidoP": vPerApellidoP,
        "vPerApellidoM": vPerApellidoM,
        "Dni": dni,
        "FechaNacimiento": "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "Foto": foto == null ? null : foto,
    };
}
