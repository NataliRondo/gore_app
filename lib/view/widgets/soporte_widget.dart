import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/open_email.dart';
import 'package:gore_app/utils/open_telefono.dart';
import 'package:gore_app/utils/open_whatsaap.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:open_mail_app/open_mail_app.dart';

Widget tarjetaSoporte(BuildContext context) {
  ResponsiveApp responsiveApp = ResponsiveApp(context);
  return Center(
    child: Column(
      children: [
        //const Text("Soporte Técnico SGD"),
        Column(
          children: [
            Text(
              "Soporte por Correo Electrónico",
              style: fontStyleSoporte,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Escribir su requerimiento al correo de la Sub Gerencia de Tecnologías de la Información - GRLL, con el fin de derivar al personal especialista de la SGTI para su atención, daremos respuesta a su correo una vez atendido de acuerdo a orden de llegada.",
                  style: TextStyle(fontFamily: "Lato"),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  EmailContent email = EmailContent(
                    to: [
                      'sgti@regionlalibertad.gob.pe',
                    ],
                    //subject: 'Hello!',
                    //body: 'How are you doing?',
                    //cc: ['user2@domain.com', 'user3@domain.com'],
                    //bcc: ['boss@domain.com'],
                  );

                  OpenMailAppResult result =
                      await OpenMailApp.composeNewEmailInMailApp(
                          nativePickerTitle:
                              'Seleccione la aplicación de correo electrónico para redactar',
                          emailContent: email);
                  if (!result.didOpen && !result.canOpen) {
                    showNoMailAppsDialog(context);
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) => MailAppPickerDialog(
                        mailApps: result.options,
                        emailContent: email,
                      ),
                    );
                  }
                },
                child: Card(
                  borderOnForeground: false,
                  //color: Tema.withOpacity(0.3),
                  child: SizedBox(
                    height: responsiveApp.hp(12),
                    width: responsiveApp.wp(80),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: responsiveApp.dp(5)),
                            child: Text(
                              "sgti@regionlalibertad.gob.pe",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: responsiveApp.dp(4.3),
                                //fontFamily: "Lato"
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.email_outlined,
                            size: responsiveApp.dp(7),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Soporte Vía Central Telefónica",
                  style: fontStyleSoporte,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Comunicarse a los siguientes anexos durante horario laboral:"),
              ),
              Padding(
                padding:  EdgeInsets.only(right: responsiveApp.dp(50),),
                child: Column(
                  children: const [
                    Text("Anexo 01: 120"),
                    Text("Anexo 02: 124"),
                    Text("Anexo 03: 137"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    const Text("Central Telefónica: 044-604000"),
                    //SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: Container(
                          height: responsiveApp.hp(8),
                          width: responsiveApp.hp(8),
                          decoration: BoxDecoration(
                              color: colorFondo,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Icon(
                            Icons.phone_outlined,
                            size: responsiveApp.hp(5.5),
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          openTelefono("044604000");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "También puede comunicarse por estos medios:",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Lato",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        openwhatsapp(context, "973438858", "");
                      },
                      child: Card(
                        borderOnForeground: false,
                        color: Whatsapp.withOpacity(0.8),
                        child: SizedBox(
                          height: responsiveApp.hp(10),
                          width: responsiveApp.wp(40),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: responsiveApp.dp(5)),
                                  child: Text(
                                    "WhatsApp",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsiveApp.dp(4.5),
                                      //fontFamily: "Lato"
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.whatsapp,
                                  size: responsiveApp.dp(5.5),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        openTelefono("+51973438858");
                      },
                      child: Card(
                        borderOnForeground: false,
                        color: colorFondo,
                        child: SizedBox(
                          height: responsiveApp.hp(10),
                          width: responsiveApp.wp(40),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: responsiveApp.dp(5),),
                                  child: Text(
                                    "Teléfono",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsiveApp.dp(4.5),
                                      //fontFamily: "Lato"
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.phone_outlined,
                                  size: responsiveApp.dp(5.5),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //const Text("Soporte Técnico SGD"),
      ],
    ),
  );
}
