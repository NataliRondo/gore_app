import 'package:flutter/material.dart';
import 'package:gore_app/utils/open_telefono.dart';
import 'package:gore_app/utils/open_whatsaap.dart';
import 'package:gore_app/utils/variables.dart';

Widget tarjetaSoporte(BuildContext context) {
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
                  "Escribir su requerimiento al correo de la Sub Gerencia de Tecnologías de la información - GRLL, con el fin de derivar al personal especialista de la SGTI para su atención, daremos respuesta a su correo una vez atendido de acuerdo a orden de llegada.",
                  style: TextStyle(fontFamily: "Lato"),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    onTap: () {
                      //_service.sendEmail("sqti@regionlalibertad.gob.pe");
                    },
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "sqti@regionlalibertad.gob.pe",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
                padding: const EdgeInsets.only(right: 240),
                child: Column(
                  children: const [
                     Text("Anexo 01: 120"),
                     Text("Anexo 02: 124"),
                     Text("Anexo 03: 137"),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    const Text("Central Telefónica: 044-604000"),
                    //SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: const Icon(
                          Icons.phone_outlined,
                          size: 20,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8,),
                child: Row(
                  children: [
                    const Text("Celular/ WhatsApp: 973438858"),
                    //SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: const Icon(
                          Icons.phone_outlined,
                          size: 20,
                        ),
                        onTap: () {
                          openTelefono("973438858");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: const Icon(
                          Icons.whatsapp,
                          size: 20,
                        ),
                        onTap: () {
                          openwhatsapp(context, "973438858", "");
                        },
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
