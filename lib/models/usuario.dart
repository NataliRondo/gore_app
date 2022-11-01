import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
         this.codUser,
         this.cdesUser,
         this.dfecCre,
         this.cuserCre,
         this.cuserMod,
         this.dfecMod,
         this.cclave,
         this.cempCodemp,
         this.esUsuario,
         this.inAcceso,
         this.dfeModClave,
         this.nuIntento,
         this.ccosCodcosto,
         this.codUserAd,
         this.flgMarca,
    });

    final String? codUser;
    final String? cdesUser;
    final dynamic dfecCre;
    final dynamic cuserCre;
    final dynamic cuserMod;
    final dynamic dfecMod;
    final dynamic cclave;
    final String? cempCodemp;
    final String? esUsuario;
    final dynamic inAcceso;
    final dynamic dfeModClave;
    final double? nuIntento;
    final dynamic ccosCodcosto;
    final dynamic codUserAd;
    final dynamic flgMarca;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        codUser: json["COD_USER"],
        cdesUser: json["CDES_USER"],
        dfecCre: json["DFEC_CRE"],
        cuserCre: json["CUSER_CRE"],
        cuserMod: json["CUSER_MOD"],
        dfecMod: json["DFEC_MOD"],
        cclave: json["CCLAVE"],
        cempCodemp: json["CEMP_CODEMP"],
        esUsuario: json["ES_USUARIO"],
        inAcceso: json["IN_ACCESO"],
        dfeModClave: json["DFE_MOD_CLAVE"],
        nuIntento: json["NU_INTENTO"],
        ccosCodcosto: json["CCOS_CODCOSTO"],
        codUserAd: json["COD_USER_AD"],
        flgMarca: json["FLG_MARCA"],
    );

    Map<String, dynamic> toJson() => {
        "COD_USER": codUser,
        "CDES_USER": cdesUser,
        "DFEC_CRE": dfecCre,
        "CUSER_CRE": cuserCre,
        "CUSER_MOD": cuserMod,
        "DFEC_MOD": dfecMod,
        "CCLAVE": cclave,
        "CEMP_CODEMP": cempCodemp,
        "ES_USUARIO": esUsuario,
        "IN_ACCESO": inAcceso,
        "DFE_MOD_CLAVE": dfeModClave,
        "NU_INTENTO": nuIntento,
        "CCOS_CODCOSTO": ccosCodcosto,
        "COD_USER_AD": codUserAd,
        "FLG_MARCA": flgMarca,
    };
}

/*
class Dependencia {
  int? iDepCodigo;
  String? vDepNombre;
  String? cDepEstado;
  int? iDepCodigoPadre;
  int? iOpcCodigo;

  Dependencia({
    this.iDepCodigo,
    this.vDepNombre,
    this.cDepEstado,
    this.iDepCodigoPadre,
    this.iOpcCodigo,
  });

  factory Dependencia.fromJson(Map<String, dynamic> json) => Dependencia(
        iDepCodigo: json["iDepCodigo"],
        vDepNombre: json["vDepNombre"],
        cDepEstado: json["cDepEstado"],
        iDepCodigoPadre: json["iDepCodigoPadre"],
        iOpcCodigo: json["iOpcCodigo"],
      );

  Map<String, dynamic> toJson() => {
        "iDepCodigo": iDepCodigo,
        "vDepNombre": vDepNombre,
        "cDepEstado": cDepEstado,
        "iDepCodigoPadre": iDepCodigoPadre,
        "iOpcCodigo": iOpcCodigo,
      };
}

class Persona {
  int? iPerCodigo;
  String? vPerNombre;
  String? vPerApellidoP;
  String? vPerApellidoM;
  String? vPerApellidos;
  String? cPerEstado;
  String? nombres;
  int? documentoIdentidad;

  Persona({
    this.iPerCodigo,
    this.vPerNombre,
    this.vPerApellidoP,
    this.vPerApellidoM,
    this.vPerApellidos,
    this.cPerEstado,
    this.nombres,
    this.documentoIdentidad,
  });

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        iPerCodigo: json["iPerCodigo"],
        vPerNombre: json["vPerNombre"],
        vPerApellidoP: json["vPerApellidoP"],
        vPerApellidoM: json["vPerApellidoM"],
        vPerApellidos: json["vPerApellidos"],
        cPerEstado: json["cPerEstado"],
        nombres: json["nombres"],
        documentoIdentidad: json["documento_identidad"],
      );

  Map<String, dynamic> toJson() => {
        "iPerCodigo": iPerCodigo,
        "vPerNombre": vPerNombre,
        "vPerApellidoP": vPerApellidoP,
        "vPerApellidoM": vPerApellidoM,
        "vPerApellidos": vPerApellidos,
        "cPerEstado": cPerEstado,
        "nombres": nombres,
        "documento_identidad": documentoIdentidad,
      };
}

class UsuarioVinculado {
  int? iUVinId;
  String? iUsuCodigo;
  String? iUsuSisgedoCodigo;

  UsuarioVinculado({
    this.iUVinId,
    this.iUsuCodigo,
    this.iUsuSisgedoCodigo,
  });

  factory UsuarioVinculado.fromJson(Map<String, dynamic> json) =>
      UsuarioVinculado(
        iUVinId: json["iUVinID"],
        iUsuCodigo: json["iUsuCodigo"],
        iUsuSisgedoCodigo: json["iUsuSisgedoCodigo"],
      );

  Map<String, dynamic> toJson() => {
        "iUVinID": iUVinId,
        "iUsuCodigo": iUsuCodigo,
        "iUsuSisgedoCodigo": iUsuSisgedoCodigo,
      };

      
}*/

