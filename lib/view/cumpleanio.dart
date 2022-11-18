// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/widgets/cuempleanio.dart';

class Cumple extends StatelessWidget {
  Usuario? usuario;
   Cumple({Key? key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            "Cumpleaños",
          ),
        )),
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
      body: CumpleanioLista(usuario: usuario,),
    );
  }
}
