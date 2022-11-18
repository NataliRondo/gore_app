// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_cumpleanio.dart';
import 'package:gore_app/models/trabajador.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/lista_cumple.dart';

// ignore: must_be_immutable
class CumpleanioLista extends StatelessWidget {
  Usuario? usuario;
  CumpleanioLista({super.key, this.usuario});

  ServicioCumpleanio servicioCumpleanio = ServicioCumpleanio();

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    String token = usuario!.token!;
    return FutureBuilder(
      future: servicioCumpleanio.getCumpleanio(token),
      builder: (context, AsyncSnapshot<List<Trabajador>> snapshot) {
        if (snapshot.hasData) {
          List<Trabajador> trabajadorLista = snapshot.data!;
          //trabajadorLista.
          return ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: responsiveApp.dp(76), top: 10),
                    child: const Text(
                      "Hoy",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: trabajadorLista
                        .map((Trabajador trabajador) => tarjetaCumple(
                              context,
                              "${trabajador.vPerNombre!} ${trabajador.vPerApellidoP!} ${trabajador.vPerApellidoM!}",
                              fontStyleCumple,
                              trabajador.foto.toString(),
                              "",
                            ))
                        .toList(),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
