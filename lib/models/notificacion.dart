// To parse this JSON data, do
//
//     final notificacion = notificacionFromJson(jsonString);

import 'dart:convert';

List<Notificaciones> notificacionesFromJson(String str) => List<Notificaciones>.from(json.decode(str).map((x) => Notificaciones.fromJson(x)));

String notificacionesToJson(List<Notificaciones> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notificaciones {
    Notificaciones({
        this.comunicadoId,
        this.titulo,
        this.descripcion,
        this.fechaInicio,
        this.fechaFin,
        this.estado,
        this.imagen,
        this.link,
        this.prioridad,
        this.registradoPor,
        this.modificadoPor,
        this.fechaRegistro,
    });

     int? comunicadoId;
     String? titulo;
     String? descripcion;
     DateTime? fechaInicio;
     DateTime? fechaFin;
     int? estado;
     String? imagen;
     String? link;
     int? prioridad;
     String? registradoPor;
     dynamic modificadoPor;
     String? fechaRegistro;

    factory Notificaciones.fromJson(Map<String, dynamic> json) => Notificaciones(
        comunicadoId: json["comunicadoID"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        estado: json["estado"],
        imagen: json["imagen"],
        link: json["link"],
        prioridad: json["prioridad"],
        registradoPor: json["registradoPor"],
        modificadoPor: json["modificadoPor"],
        fechaRegistro: json["fechaRegistro"],
    );

    Map<String, dynamic> toJson() => {
        "comunicadoID": comunicadoId,
        "titulo": titulo,
        "descripcion": descripcion,
        "fechaInicio": "${fechaInicio!.year.toString().padLeft(4, '0')}-${fechaInicio!.month.toString().padLeft(2, '0')}-${fechaInicio!.day.toString().padLeft(2, '0')}",
        "fechaFin": "${fechaFin!.year.toString().padLeft(4, '0')}-${fechaFin!.month.toString().padLeft(2, '0')}-${fechaFin!.day.toString().padLeft(2, '0')}",
        "estado": estado,
        "imagen": imagen,
        "link": link,
        "prioridad": prioridad,
        "registradoPor": registradoPor,
        "modificadoPor": modificadoPor,
        "fechaRegistro": fechaRegistro,
    };
}
