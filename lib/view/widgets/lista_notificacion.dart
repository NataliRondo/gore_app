// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';

notificacion(BuildContext context, String imagen, String titulo,
    TextStyle textStyle, String subtitulo) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
    child: Card(
      //color: Colors.blueGrey.withOpacity(0.1),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.blueGrey.withOpacity(0.3), width: 2.0),
      ),
      //color: Color.fromARGB(51, 96, 125, 139),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: responsiveApp.wp(100),
          height: responsiveApp.hp(15),
          child: Row(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: responsiveApp.dp(7),
                    backgroundColor: colorRandom,
                    child: CircleAvatar(
                      radius: responsiveApp.dp(10),
                      //backgroundImage: foto.image,
                      backgroundImage: AssetImage(imagen),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: SizedBox(
                        width: responsiveApp.wp(65),
                        child: ListTile(
                          title: Text(
                            textAlign: TextAlign.left,
                            titulo,
                            style: textStyle,
                          ),
                          //subtitle: Text("data"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
