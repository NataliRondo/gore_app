// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_cumpleanio.dart';
import 'package:gore_app/models/cumpleanios_dia.dart';
import 'package:gore_app/models/cumpleanios_diaA.dart';
import 'package:gore_app/models/cumpleanios_diaH.dart';
import 'package:gore_app/models/cumpleanios_diaM.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/lista_cumple.dart';

// ignore: must_be_immutable
class CumpleanioLista extends StatefulWidget {
  Usuario? usuario;
  CumpleanioLista({super.key, this.usuario});

  @override
  State<CumpleanioLista> createState() => _CumpleanioListaState();
}

class _CumpleanioListaState extends State<CumpleanioLista> {

  ServicioCumpleanio servicioCumpleanio = ServicioCumpleanio();

  List<CumpleanioDia> cumpleanioHoy = [];

  List<CumpleanioDia> cumpleanio = [];

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    String token = widget.usuario!.token!;
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: responsiveApp.dp(76), top: 10),
              child: const Text(
                "Hoy",
                textAlign: TextAlign.right,
              ),
            ),
            FutureBuilder(
              future: servicioCumpleanio.getCumpleanioDiaHoy(
                token,
              ),
              builder: (context, AsyncSnapshot<List<CumpleanioDiaH>> snapshot) {
                if (snapshot.hasData) {
                  List<CumpleanioDiaH> cumpleanioLista = snapshot.data!;
                  return Column(
                    children: [
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: cumpleanioLista
                            .map(
                                (CumpleanioDiaH cumpleanioDia) => tarjetaCumple(
                                      context,
                                      "${cumpleanioDia.vPerNombre!} ${cumpleanioDia.vPerApellidoP!} ${cumpleanioDia.vPerApellidoM!}",
                                      fontStyleCumple,
                                      cumpleanioDia.foto.toString(),
                                      "",
                                    ))
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: responsiveApp.dp(76), top: 10),
              child: const Text(
                "Mañana",
                textAlign: TextAlign.right,
              ),
            ),
            FutureBuilder(
              future: servicioCumpleanio.getCumpleanioDiaManana(
                token,
              ),
              builder: (context, AsyncSnapshot<List<CumpleanioDiaM>> snapshot) {
                if (snapshot.hasData) {
                  List<CumpleanioDiaM> cumpleanioLista = snapshot.data!;
                  return Column(
                    children: [
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: cumpleanioLista
                            .map(
                                (CumpleanioDiaM cumpleanioDia) => tarjetaCumple(
                                      context,
                                      "${cumpleanioDia.vPerNombre!} ${cumpleanioDia.vPerApellidoP!} ${cumpleanioDia.vPerApellidoM!}",
                                      fontStyleCumple,
                                      cumpleanioDia.foto.toString(),
                                      "",
                                    ))
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: responsiveApp.dp(76), top: 10),
              child: const Text(
                "Ayer",
                textAlign: TextAlign.right,
              ),
            ),
            FutureBuilder(
              future: servicioCumpleanio.getCumpleanioDiaAyer(
                token,
              ),
              builder: (context, AsyncSnapshot<List<CumpleanioDiaA>> snapshot) {
                if (snapshot.hasData) {
                  List<CumpleanioDiaA> cumpleanioLista = snapshot.data!;
                  return Column(
                    children: [
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: cumpleanioLista
                            .map(
                                (CumpleanioDiaA cumpleanioDia) => tarjetaCumple(
                                      context,
                                      "${cumpleanioDia.vPerNombre!} ${cumpleanioDia.vPerApellidoP!} ${cumpleanioDia.vPerApellidoM!}",
                                      fontStyleCumple,
                                      cumpleanioDia.foto.toString(),
                                      "",
                                    ))
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
