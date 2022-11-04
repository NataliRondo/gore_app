
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/asistenciaView.dart';
import 'package:gore_app/view/cumple.dart';
import 'package:gore_app/view/notificaciones.dart';
import 'package:gore_app/view/soporteView.dart';

menuDrawer(BuildContext context, String foto, String nombre) {
  Uint8List bytes = base64.decode(foto.split(',').last);
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Drawer(
    child: ListView(
      children: [
        SizedBox(
          height: responsiveApp.wp(60),
          child: DrawerHeader(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: colorFondo,
            ),
            child: Column(
              children: [
                SizedBox(
                  //padding: EdgeInsets.only(right: responsiveApp.dp(10)),
                  width: responsiveApp.wp(30),
                  height: responsiveApp.wp(30),
                  child: CircleAvatar(
                    radius: responsiveApp.dp(30),
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: responsiveApp.dp(25),
                      //child: Image.memory(bytes),
                      backgroundImage: MemoryImage(bytes, scale: 0.3),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: responsiveApp.dp(3), right: responsiveApp.dp(8)),
                    width: responsiveApp.wp(50),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          nombre,
                          //oUsuario.persona.vPerApellidos,
                          textAlign: TextAlign.right,
                          style: fontStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                    builder: ((context) => const AsistenciaView())));
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
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Cumple())));
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
        ListTile(
          leading: Icon(
            Icons.arrow_back,
            color: Tema,
          ),
          title: const Text("Cerrar sesión"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const SoporteView())));
          },
        ),
      ],
    ),
  );
}
