// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gore_app/models/asistencia.dart';

class ListaAistencia extends StatefulWidget {
  const ListaAistencia({super.key});

  @override
  State<ListaAistencia> createState() => _ListaAistenciaState();
}

class _ListaAistenciaState extends State<ListaAistencia> {
  @override
  Widget build(BuildContext context) {
    List<AsistenciaCalendar> asistencias = [];
    return ListView.builder(
      itemCount: asistencias.length,
      itemBuilder: ((context, index) {
      AsistenciaCalendar asistencia = asistencias[index];
      return ListTile(
        leading: Text(asistencia.day.toString()),
        title: Text(asistencia.entrada.toString()),
        subtitle: Text(asistencia.salida.toString()),
      );
    }));
  }
}
