// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_null_comparison
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/asistenciaView.dart';
import 'package:gore_app/view/cumpleanio.dart';
import 'package:gore_app/view/loginView.dart';
import 'package:gore_app/view/notificacionesView.dart';
import 'package:gore_app/view/soporteView.dart';

Widget menuDrawer(BuildContext context, Usuario usuario) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.calendar_month,
            color: Tema,
          ),
          title: const Text("Mis Marcaciones"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: ((context) => AsistenciaView(
                      usuario: usuario,
                    )),
              ),
            );
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
              context,
              CupertinoPageRoute(
                builder: ((context) => Cumple(
                      usuario: usuario,
                    )),
              ),
            );
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
              CupertinoPageRoute(
                builder: ((context) => NotificacionesView(
                      usuario: usuario,
                    )),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(
            Icons.contacts,
            color: Tema,
          ),
          title: const Text("Soporte Técnico SGTI"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: ((context) => const SoporteView()),
              ),
            );
          },
        ),
        Divider(
          color: Colors.black26,
          height: 15,
          
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Tema,
          ),
          title: const Text("Cerrar Sesión"),
          onTap: () {
            Navigator.of(context).pop();
            final dbHelper = DatabaseHelper.instance;
            dbHelper.delete(usuario.codUser!);
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: ((context) => const LoginView()),
              ),
            );
          },
        ),
      ],
    ),
  );
}
