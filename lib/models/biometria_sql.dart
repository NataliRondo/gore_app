import 'dart:convert';

Biometriasql configuracionUsuarioFromJson(String str) =>
    Biometriasql.fromDB(json.decode(str));

class Biometriasql {
  Biometriasql({
        this.dni,
    this.password,
    });
  String? dni;
  String? password;


  Map<String, dynamic> toMapForDb() {
    var map = <String, dynamic>{};
    map["DNI"] = dni;
    map["password"] = password;

    return map;
  }

  Biometriasql.fromDB(Map<String, dynamic> map) {
    dni = map['DNI'];
    password = map['password'];
  }
}
