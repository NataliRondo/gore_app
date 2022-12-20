// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gore_app/utils/colores.dart';

detalleNotificacion(BuildContext context, String notificacion, String detalle,
    // ignore: non_constant_identifier_names
    String fechaRegistro, String Registrado) {
      print(detalle);
  return Scaffold(
    appBar: AppBar(
      title: Text(
        notificacion,
        style: const TextStyle(fontSize: 15),
      ),
      backgroundColor: colorFondo,
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.arrow_back),
        onPressed: () async {
          Navigator.pop(context);
        },
      ),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
          child: Center(
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    fechaRegistro,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Lato',),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    Registrado,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Lato',),
                    textAlign: TextAlign.right,
                  )
                ]),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Center(
              child: Text(
            notificacion,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lato',),
            textAlign: TextAlign.center,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Html(data: detalle),
            ),
          ),
        ),
      ],
    ),
  );
}
