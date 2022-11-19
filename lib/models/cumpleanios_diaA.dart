// ignore_for_file: prefer_if_null_operators

class CumpleanioDiaA {
  CumpleanioDiaA({
    this.dia,
    this.vPerNombre,
    this.vPerApellidoP,
    this.vPerApellidoM,
    this.dni,
    this.fechaNacimiento,
    this.foto,
  });
  String? dia;
  String? vPerNombre;
  String? vPerApellidoP;
  String? vPerApellidoM;
  String? dni;
  DateTime? fechaNacimiento;
  String? foto;

  factory CumpleanioDiaA.fromJson(Map<String, dynamic> json) => CumpleanioDiaA(
        dia: json["dia"],
        vPerNombre: json["vPerNombre"],
        vPerApellidoP: json["vPerApellidoP"],
        vPerApellidoM: json["vPerApellidoM"],
        dni: json["Dni"],
        fechaNacimiento: DateTime.parse(json["FechaNacimiento"]),
        foto: json["Foto"] == null ? null : json["Foto"],
      );

  Map<String, dynamic> toJson() => {
        "dia": dia,
        "vPerNombre": vPerNombre,
        "vPerApellidoP": vPerApellidoP,
        "vPerApellidoM": vPerApellidoM,
        "Dni": dni,
        "FechaNacimiento":
            "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "Foto": foto == null ? null : foto,
      };
}
