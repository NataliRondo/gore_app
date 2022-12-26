// ignore_for_file: must_be_immutable, file_names, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_asistencia.dart';
import 'package:gore_app/models/asistencias.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/view/widgets/asistencia_widget.dart';

class ListaAsistencias extends StatefulWidget {
  Usuario? usuario;
  String? day;
  ListaAsistencias({Key? key, this.usuario, this.day}) : super(key: key);

  @override
  State<ListaAsistencias> createState() => _ListaAsistenciasState(usuario, day);
}

class _ListaAsistenciasState extends State<ListaAsistencias> {
  Usuario? usuario;
  String? day;
  _ListaAsistenciasState(this.usuario, this.day);

  ServicioAsistencia servicioAsistencia = ServicioAsistencia();

  @override
  Widget build(BuildContext context) {
    String dni = usuario!.codUser!;
    String token = usuario!.token!;
    return FutureBuilder(
      future: servicioAsistencia.getAsistenciasDia(dni, token, widget.day!),
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
                child: Card(
                  color: const Color.fromARGB(255, 232, 241, 248),
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: asistenciasLista.length == 0
                          ? [
                              ListTile(
                                title: Text("No hay asistencias"),
                              )
                            ]
                          : asistenciasLista
                              .map((Asistencias asistencia) => asistenciaWidget(
                                  asistencia.nombreDia!,
                                  asistencia.hora!,
                                  asistencia.fecha!))
                              .toList()),
                ),
              ),
            ),
          );
        } else {
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(15),
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );
  }
}

/**
 * FutureBuilder(
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
 */