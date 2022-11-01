import 'package:flutter/material.dart';
import 'package:gore_app/utils/responsive.dart';

tarjetaCumple(BuildContext context, String titulo, TextStyle textStyle) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.blueGrey.withOpacity(0.5), width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
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
              SizedBox(
                width: responsiveApp.wp(30),
                child: Center(
                  child: Text(
                    titulo,textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
