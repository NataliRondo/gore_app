import 'package:flutter/material.dart';
import 'package:gore_app/utils/variables.dart';

asistenciaWidget(String nombreDia, String hora, DateTime fecha) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Card(
      color: const Color.fromARGB(255, 221, 239, 255),
      elevation: 2,
      child: ListTile(
        title: Text("Día : $nombreDia"),
        subtitle: Column(
          children: [
            Text(
              "Hora: $hora",
              textAlign: TextAlign.right,
            ),
            Text(
              "Fecha: ${dateFormat.format(fecha)}",
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ),
  );
}
