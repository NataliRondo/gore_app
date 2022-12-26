import 'package:flutter/material.dart';
import 'package:gore_app/utils/variables.dart';

Widget asistenciaWidget(String nombreDia, String hora, DateTime fecha) {
  return 
  Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      title: Text("Día : $nombreDia"),
      subtitle: Column(
        children: [
          Text(
            "Fecha: ${dateFormat.format(fecha)}",
            textAlign: TextAlign.right,
          ),
          Text(
            "Hora: $hora",
            textAlign: TextAlign.right,
          ),
        ],
      ),
    ),
  );
}
