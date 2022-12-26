// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gore_app/data/services_biometria/auth.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/data/sqlite/biometria_sql.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/biometria_sql.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/dialogCustom.dart';
import 'package:quickalert/quickalert.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? dni;
  String? password;
  @override
  void initState() {
    super.initState();
    obtenerDatos();
  }

  void obtenerDatos() async {
    final dbHelper = DatabaseHelper.instance;
    int? allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      UsuarioLite? usuarioLite = await dbHelper.getUsuario();
      print(usuarioLite!.DNI!);
      print(usuarioLite.vUsuContrasenia);
      setState(() {
        dni = usuarioLite.DNI!;
        password = usuarioLite.vUsuContrasenia;
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dbHelperBio = BiometriaSQL.instance;
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    
    String? estado;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Autenticación local'),
        backgroundColor: colorFondo,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(responsiveApp.dp(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: responsiveApp.dp(30)),
              const SizedBox(height: 20),
               Text(
                  'Toque el botón para autenticarse con el sistema\ de autenticación local del dispositivo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: responsiveApp.dp(5),
                    color: Colors.black,
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: responsiveApp.wp(55),
                child: TextButton(
                  onPressed: () async {
                    bool isAuthenticated = await AuthService.authenticateUser();
                    
                    if (isAuthenticated) {
                      int? allRows = await dbHelperBio.queryRowCount();
                      if (allRows == 0) {
                        Biometriasql biometriasql =
                            Biometriasql(dni: dni, password: password);
                        dbHelperBio.insert(biometriasql);
                        estado = "Insertado";
                        print("Insertado");
                        print(biometriasql.dni);
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: "Se ha registrado con éxito.");
                      } else {
                        if (allRows == 1) {
                          Biometriasql biometriasql =
                              Biometriasql(dni: dni, password: password);
                          dbHelperBio.update(dni!, biometriasql);
                          print("Actualizado");
                          estado = "Actualizado";
                          print(biometriasql.dni);
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: "Se ha actualizado con éxito.");
                        }
                        /*
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: "ERROR DE REGISTRO.");*/

                      }
                      print("El estado se ha: $estado");
                    } else {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: "LA AUTENTICACIÓN FALLO.");
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(responsiveApp.dp(4.5)),
                    backgroundColor: colorFondo,
                    shadowColor: const Color(0xFF323247),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REGISTRO BIOMETRICO',
                        style: TextStyle(
                          fontSize: responsiveApp.dp(4),
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              botonElimarHuella(
                responsiveApp: responsiveApp,
                dbHelperBio: dbHelperBio,
                dni: dni,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class botonElimarHuella extends StatelessWidget {
  const botonElimarHuella({
    Key? key,
    required this.responsiveApp,
    required this.dbHelperBio,
    required this.dni,
  }) : super(key: key);

  final ResponsiveApp responsiveApp;
  final BiometriaSQL dbHelperBio;
  final String? dni;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: colorFondo,
      child: MaterialButton(
        minWidth: responsiveApp.wp(40),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alerta(context, dbHelperBio, dni!);
              });

          //dbHelperBio.delete(dni!);
          /*
          //dbHelperBio.delete(biometriasql!.dni!);*/
        },
        child: Text(
          "Eliminar huella",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: responsiveApp.dp(4)),
        ),
      ),
    );
  }
}
