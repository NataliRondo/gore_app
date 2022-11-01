// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

UsuarioLite usuarioFromJson(String str) => UsuarioLite.fromBD(json.decode(str));

//String usuarioToJson(UsuarioLite data) => json.encode(data.toJson());

class UsuarioLite {
  int? id_usu;
  String? vUsuNick;
  String? vUsuContrasenia;
  String? vPerNombre;
  String? vPerApellidos;
  String? foto;
  String? DNI;

  UsuarioLite(
      this.id_usu,
      this.vUsuNick,
      this.vUsuContrasenia,
      this.vPerNombre,
      this.vPerApellidos,
      this.foto,
      this.DNI);

  Map<String, dynamic> toMapForDb() {
    var map = <String, dynamic>{};
    map['id_usu'] = id_usu;
    map['vUsuNick'] = vUsuNick;
    map['vUsuContrasenia'] = vUsuContrasenia;
    map['vPerApellidos'] = vPerApellidos;
    map['vPerNombre'] = vPerNombre;
    map['foto'] = foto;
    map['DNI'] = DNI;
    return map;
  }

  UsuarioLite.fromBD(Map<String, dynamic> map) {
    id_usu = map['id_usu'];
    vUsuNick = map['vUsuNick'];
    vUsuContrasenia = map['vUsuContrasenia'];
    vPerApellidos = map['vPerApellidos'];
    vPerNombre = map['vPerNombre'];
    foto = map['foto'];
    DNI = map['DNI'];
  }
}
