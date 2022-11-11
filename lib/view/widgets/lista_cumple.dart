import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';

tarjetaCumple(
  BuildContext context,
  String nombre,
  TextStyle textStyle,
  String dependencia,
) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: FlipCard(
        front: Card(
          color: front,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.blueGrey.withOpacity(0.5), width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: responsiveApp.wp(37),
              height: responsiveApp.hp(35),
              child: Column(
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
                      backgroundImage: const AssetImage("src/logo_region.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: responsiveApp.wp(30),
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
          color: AzulApp.withOpacity(0.3),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.blueGrey.withOpacity(0.5), width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: responsiveApp.wp(35),
              height: responsiveApp.hp(30),
              child: Column(
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
                      backgroundImage: const AssetImage("src/logo_region.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    width: responsiveApp.wp(30),
                    child: Center(
                      child: Text(
                        dependencia,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
