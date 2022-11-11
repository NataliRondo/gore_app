// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/asistenciaView.dart';
import 'package:gore_app/view/cumpleanio.dart';
import 'package:gore_app/view/notificaciones.dart';
import 'package:gore_app/view/soporteView.dart';

Widget menuDrawer(BuildContext context, Usuario usuario) {
  //ConfiguracionUsuario? configuracionUsuario;

  return SingleChildScrollView(
      child: Column(
    children: [
      ListTile(
        leading: Icon(
          Icons.calendar_month,
          color: Tema,
        ),
        title: const Text("Asistencias"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => AsistenciaView(
                        usuario: usuario,
                      ))));
        },
      ),
      ListTile(
        leading: Icon(
          Icons.event_outlined,
          color: Tema,
        ),
        title: const Text("Cumpleaños"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Cumple())));
        },
      ),
      ListTile(
        leading: Icon(
          Icons.notifications,
          color: Tema,
        ),
        title: const Text("Notificaciones"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const Notificaciones())));
        },
      ),
      ListTile(
        leading: Icon(
          Icons.contacts,
          color: Tema,
        ),
        title: const Text("Soporte Informático"),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SoporteView())));
        },
      ),

     /** ListTile(
        leading: Icon(
          Icons.arrow_back,
          color: Tema,
        ),
        title: const Text("Cerrar sesión"),
        onTap: () {
          
           * if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
           
        },
      ),*/
    ],
  ));
}
