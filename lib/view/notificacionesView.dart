// ignore_for_file: unused_field, unused_element, prefer_const_constructors, must_be_immutable, no_logic_in_create_state, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_notificacion.dart';
import 'package:gore_app/models/notificacion.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/detalleNotificacion.dart';
import 'package:gore_app/view/widgets/lista_notificacion.dart';

class NotificacionesView extends StatefulWidget {
  Usuario? usuario;
  NotificacionesView({Key? key, this.usuario}) : super(key: key);

  @override
  State<NotificacionesView> createState() => _NotificacionesViewState(usuario);
}

class _NotificacionesViewState extends State<NotificacionesView> {
  Usuario? usuario;
  _NotificacionesViewState(this.usuario);

  ServicioNotificacion servicioNotificacion = ServicioNotificacion();

  @override
  Widget build(BuildContext context) {
    String token = usuario!.token!;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notificaciones"),
          backgroundColor: colorFondo,
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ),
        body: FutureBuilder(
          future: servicioNotificacion.getNotificacion(token),
          builder: (context, AsyncSnapshot<List<Notificaciones>> snapshot) {
            if (snapshot.hasData) {
              List<Notificaciones> notificacionesLista = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(13),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: notificacionesLista
                            .map(
                              (Notificaciones notificaciones) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => detalleNotificacion(
                                        context,
                                        notificaciones.titulo!,
                                        notificaciones.descripcion!,
                                        notificaciones.fechaRegistro!,
                                        notificaciones.registradoPor!,
                                      ),
                                    ),
                                  );
                                },
                                child: notificacion(
                                    context,
                                    "src/ban.png",
                                    notificaciones.titulo!,
                                    fontStyleNotificaciones,
                                    notificaciones.titulo!),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ));
  }
}
