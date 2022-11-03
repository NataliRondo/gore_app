// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

UsuarioLite usuarioFromJson(String str) => UsuarioLite.fromBD(json.decode(str));

//String usuarioToJson(UsuarioLite data) => json.encode(data.toJson());

class UsuarioLite {
  String? DNI;
  String? vUsuNick;
  String? vUsuContrasenia;
  String? vPerNombre;
  String? vPerApellidos;
  String? foto;
  String? dependencia;

  UsuarioLite(
    this.DNI,
    this.vUsuNick,
    this.vUsuContrasenia,
    this.vPerNombre,
    this.vPerApellidos,
    this.foto,
    this.dependencia
  );

  Map<String, dynamic> toMapForDb() {
    var map = <String, dynamic>{};
    map['DNI'] = DNI;
    map['vUsuNick'] = vUsuNick;
    map['vUsuContrasenia'] = vUsuContrasenia;
    map['vPerApellidos'] = vPerApellidos;
    map['vPerNombre'] = vPerNombre;
    map['foto'] = foto;
    map['dependencia'] = dependencia;


    return map;
  }

  UsuarioLite.fromBD(Map<String, dynamic> map) {
    DNI = map['DNI'];
    vUsuNick = map['vUsuNick'];
    vUsuContrasenia = map['vUsuContrasenia'];
    vPerApellidos = map['vPerApellidos'];
    vPerNombre = map['vPerNombre'];
    foto = map['foto'];
    dependencia = map['dependencia'];
  }
}
