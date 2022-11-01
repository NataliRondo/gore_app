
import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/variables.dart';

Widget botonSoporte(BuildContext context, String? nombre, String? celular, String? mensaje, IconData icon1, IconData icon2) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
    child: Card(
      elevation: 2,
      borderOnForeground: true,
      shadowColor: Colors.blueAccent.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Row(
            children: [
              Text(
                nombre.toString(),
                style: fontStyleSoporte,
              ),
              IconButton(
                onPressed: () {
                  //openwhatsapp(context, "$celular", mensaje.toString());
                },
                icon: Icon(
                  icon1,
                  color: Whatsapp,
                ),
              ),
              IconButton(
                onPressed: () {
                  //openwhatsapp(context, "$celular", mensaje.toString());
                },
                icon: Icon(
                  icon2,
                  color: AzulApp,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
