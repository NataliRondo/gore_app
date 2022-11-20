// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';

Widget tarjetaCumple(
  BuildContext context,
  String nombre,
  TextStyle textStyle,
  String? foto,
  String dependencia,
) {
  Uint8List? bytes = base64.decode(foto!.split(',').last);
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FlipCard(
              front: Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: colorFondo, width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: responsiveApp.wp(42),
                    height: responsiveApp.hp(40),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        if (foto == "null")
                          CircleAvatar(
                            radius: responsiveApp.dp(10),
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: responsiveApp.dp(8),
                              //backgroundImage: foto.image,
                              backgroundImage:
                                  const AssetImage("src/logo_region.png"),

                              backgroundColor: Colors.transparent,
                            ),
                          )
                        else
                          CircleAvatar(
                            radius: responsiveApp.dp(10),
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: responsiveApp.dp(8),
                              //backgroundImage: foto.image,
                              backgroundImage: MemoryImage(bytes, scale: 0.3),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(35),
                          child: Center(
                            child: Text(
                              nombre,
                              textAlign: TextAlign.center,
                              style: textStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              back: Card(
                color: colorFondo,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                      color: Colors.blueGrey.withOpacity(0.5), width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: responsiveApp.wp(35),
                    height: responsiveApp.hp(30),
                    child: ListView(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: responsiveApp.dp(10),
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: responsiveApp.dp(8),
                            //backgroundImage: foto.image,
                            backgroundImage:
                                const AssetImage("src/logo_region.png"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: responsiveApp.wp(30),
                          child: const Center(
                            child: Text("",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
}
