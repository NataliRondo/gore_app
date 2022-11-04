import 'dart:convert';

ConfiguracionUsuario configuracionUsuarioFromJson(String str) =>
    ConfiguracionUsuario.fromDB(json.decode(str));

//String configuracionUsuarioToJson(ConfiguracionUsuario data) =>json.encode(data.toJson());

class ConfiguracionUsuario {
  String? dni;
  String? foto;

  ConfiguracionUsuario(
    this.dni,
    this.foto,
  );

  Map<String, dynamic> toMapForDb() {
    var map = <String, dynamic>{};
    map["DNI"] = dni;
    map["foto"] = foto;

    return map;
  }

  ConfiguracionUsuario.fromDB(Map<String, dynamic> map) {
    dni = map['DNI'];
    foto = map['foto'];
  }
}
