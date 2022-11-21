import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_asistencia.dart';
import 'package:gore_app/models/asistencias.dart';
import 'package:gore_app/utils/variables.dart';

Widget asistenciaDetalle(String dni, String token){
  ServicioAsistencia servicioAsistencia = ServicioAsistencia();
  return FutureBuilder(
      future: servicioAsistencia.getAsistencias(dni, token),
      builder: (context, AsyncSnapshot<List<Asistencias>> snapshot) {
        if (snapshot.hasData) {
          List<Asistencias> asistenciasLista = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(
              right: 5,
              left: 5,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: asistenciasLista
                      .map(
                        (Asistencias asistencia) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Card(
                            color: const Color.fromARGB(255, 221, 239, 255),
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                  "Día : ${asistencia.nombreDia.toString()}"),
                              subtitle: Column(
                                children: [
                                  Text(
                                    "Hora: ${asistencia.hora}",
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    "Fecha: ${dateFormat.format(asistencia.fecha!)}",
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        } else {
          return const Text("data");
        }
      },
    );
}