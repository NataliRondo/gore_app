import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/open_telefono.dart';
import 'package:gore_app/utils/open_whatsaap.dart';
import 'package:gore_app/utils/variables.dart';

Widget botonSoporte(BuildContext context, String? nombre, String? celular,
    String? mensaje, IconData whatsapp, IconData phone) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
    child: Card(
      elevation: 2,
      borderOnForeground: true,
      shadowColor: Colors.blueAccent.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Column(
            children: [
              Text(
                nombre.toString(),
                style: fontStyleSoporte,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Center(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          openwhatsapp(context, "$celular", mensaje.toString());
                        },
                        icon: Icon(
                          whatsapp,
                          color: Whatsapp,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await openTelefono(celular);
                        },
                        icon: Icon(
                          phone,
                          color: AzulApp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


