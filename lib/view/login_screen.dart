// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gore_app/data/services_biometria/auth.dart';
import 'package:gore_app/data/sqlite/biometria_sql.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/biometria_sql.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:quickalert/quickalert.dart';

class LoginPage extends StatelessWidget {
  UsuarioLite? usuarioLite;
  LoginPage({Key? key, this.usuarioLite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbHelper = BiometriaSQL.instance;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Autenticación local'),
        backgroundColor: colorFondo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.lock, size: size.width * 0.3),
              const SizedBox(height: 20),
              const Text(
                  'Toque el botón para autenticarse con el sistema\ de autenticación local del dispositivo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: size.width,
                child: TextButton(
                  onPressed: () async {
                    bool isAuthenticated = await AuthService.authenticateUser();
                    if (isAuthenticated) {
                      if (usuarioLite != null) {
                        String dni = usuarioLite!.DNI.toString();
                        //dbHelper.delete(dni);
                        String password =
                            usuarioLite!.vUsuContrasenia.toString();
                        int? allRows = await dbHelper.queryRowCount();
                        if (allRows == 0) {
                          Biometriasql biometriasql =
                              Biometriasql(dni, password);
                          dbHelper.insert(biometriasql);
                          print("Insertado");
                          print(biometriasql.dni);
                        } else {
                          if (allRows == 1) {
                            Biometriasql biometriasql =
                                Biometriasql(dni, password);
                            dbHelper.update(dni, biometriasql);
                            print("Actualizado");
                            print(biometriasql.dni);
                          }
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: "ERROR DE REGISTRO.");
                        }
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: "Se ha registrado con éxito");
                      } else {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: "ERROR DE REGISTRO.");
                      }
                    } else {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: "LA AUTENTICACIÓN FALLO.");
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: colorFondo,
                    shadowColor: const Color(0xFF323247),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'REGISTRO BIOMETRICO',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
