import 'package:flutter/material.dart';
import 'package:gore_app/utils/open_telefono.dart';
import 'package:gore_app/utils/open_whatsaap.dart';
import 'package:gore_app/utils/responsive.dart';

Widget listaNumero(BuildContext context, String numeroTelefono, String mensaje,
    String nombre) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        
        Card(
          elevation: 5,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: responsiveApp.hp(12),
                  width: responsiveApp.dp(12),
                  child: CircleAvatar(
                    radius: 10,
                    child: Image(
                      image: AssetImage("src/usuario.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: responsiveApp.dp(55),
                child: Column(
                  children: [
                    Text(nombre),
                    Text(numeroTelefono),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: responsiveApp.dp(4),
                  child: InkWell(
                    onTap: () {
                      openTelefono("+$numeroTelefono");
                    },
                    child: Icon(
                      Icons.phone_outlined,
                      size: responsiveApp.dp(5.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: responsiveApp.dp(4),
                  child: InkWell(
                    onTap: () {
                      openwhatsapp(context, "+$numeroTelefono", mensaje);
                    },
                    child: Icon(
                      Icons.whatsapp_outlined,
                      size: responsiveApp.dp(5.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
