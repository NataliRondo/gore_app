// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, no_logic_in_create_state

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class PerfilUsuario extends StatefulWidget {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  PerfilUsuario({Key? key, this.oUsuario, this.usuarioLite}) : super(key: key);

  @override
  _PerfilUsuarioState createState() =>
      _PerfilUsuarioState(oUsuario, usuarioLite);
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;

  _PerfilUsuarioState(this.oUsuario, this.usuarioLite);

  String img = "";
  File? imagen;
  final picker = ImagePicker();
  bool flag = true;

  Future selimagen(op) async {
    XFile? pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 566,
        //maxWidth: 1350,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        //maxHeight: 566,
        //maxWidth: 1350,
      );
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        //usuarioLite!.foto = imagen!.path;
        img = imagen!.path;
      } else {
        print("No selecciono nada");
      }
    });

    Navigator.of(context).pop();
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(2),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selimagen(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Tomar foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.photo_camera,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selimagen(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Seleccionar foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.photo_library,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 141, 141),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Cancelar",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey keyScaffold = GlobalKey();
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    String dni = oUsuario!.codUser.toString();
    //String imagen64;
    //File image = imagen as File;
    return Scaffold(
      //key: keyScaffold,
      body: Column(
        
        children: [
          Container(
            height: responsiveApp.hp(70),
            color: colorFondo,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: responsiveApp.dp(3)),
                      width: responsiveApp.wp(50),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              //"Natali",
                              oUsuario!.cdesUser.toString(),
                              //oUsuario.persona.vPerApellidos,
                              textAlign: TextAlign.right,
                              style: fontStyle,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "",
                              //oUsuario.persona.vPerNombre,
                              textAlign: TextAlign.right,
                              style: fontStyle,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              //"75900795",
                              dni,
                              textAlign: TextAlign.right,
                              style: fontStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        opciones(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          right: responsiveApp.dp(5),
                        ),
                        width: responsiveApp.wp(50),
                        child: CircleAvatar(
                          radius: responsiveApp.dp(30),
                          backgroundColor: Colors.white,
                          child: imagen != null
                              ? CircleAvatar(
                                  radius: responsiveApp.dp(25),
                                  backgroundColor: Colors.transparent,
                                  //backgroundImage: FileImage(imagen!, scale: 2),
                                  child: 
                                  Image.file(
                                  imagen!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                                )
                              : CircleAvatar(
                                  radius: responsiveApp.dp(25),
                                  //backgroundImage: foto.image,
                                  backgroundImage:
                                      const AssetImage("src/usuario.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: responsiveApp.wp(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Sistemas",
                      //oUsuario.dependencia.vDepNombre,
                      textAlign: TextAlign.center,
                      style: fontStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              responsiveApp.dp(2.5),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: responsiveApp.hp(55),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            //left: responsiveApp.dp(3),
                            top: responsiveApp.dp(4),
                          ),
                          width: responsiveApp.wp(60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              QrImage(
                                //oUsuario.dni + "%Q" + strFecha + "%Q" + strHora,
                                data: "$dni%Q$strFecha%Q$strHora",
                                version: 2,
                                size: responsiveApp.dp(50),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: responsiveApp.wp(35),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  strFecha,
                                  textAlign: TextAlign.center,
                                  style: fontStyleHora,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  strHora,
                                  textAlign: TextAlign.center,
                                  style: fontStyleHora,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: responsiveApp.dp(20),
            ),
            child: Image.asset(
              "src/logo_horz.png",
              height: responsiveApp.hp(10),
              width: responsiveApp.wp(40),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
