// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, no_logic_in_create_state, deprecated_member_use, unnecessary_null_comparison, prefer_typing_uninitialized_variables
// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/data/sqlite/configuracion.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/configuracion.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/updateDialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_version/new_version.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class PerfilUsuario extends StatefulWidget {
  Usuario oUsuario;
  UsuarioLite usuarioLite;
  PerfilUsuario({Key key, this.oUsuario, this.usuarioLite}) : super(key: key);

  @override
  _PerfilUsuarioState createState() =>
      _PerfilUsuarioState(oUsuario, usuarioLite);
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  Usuario oUsuario;
  UsuarioLite usuarioLite;

  _PerfilUsuarioState(
    this.oUsuario,
    this.usuarioLite,
  );

  bool flag = true;
  String imagePath;
  String imagen64;
  Uint8List bytesConfiguracion;
  ConfiguracionUsuario configuracionUsuario;

  @override
  void initState() {
    //obtenerDatos();
    super.initState();

     final newVersion = NewVersion(
      androidId: 'org.telegram.messenger',
    );

    Timer(const Duration(milliseconds: 800), () {
      checkNewVersion(newVersion);
    });

    super.initState();
  }

  void checkNewVersion(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if(status != null) {
      if(status.canUpdate) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return UpdateDialog(
              allowDismissal: true,
              description: status.releaseNotes,
              version: status.storeVersion,
              appLink: status.appStoreLink,
            );
          },
        );
      }
    }
  }

  obtenerDatos() async {
    final dbHelper = ConfiguracionBack.instance;
    int allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      ConfiguracionUsuario usuarioConf =
          await dbHelper.getUsuarioConfiguracion();
      setState(() {
        configuracionUsuario.dni = usuarioConf.dni;
        configuracionUsuario.foto = usuarioConf.foto;
        imagen64 = usuarioConf.foto;
        bytesConfiguracion = obtenerFotoConfiguracion(configuracionUsuario);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytesUsuarioLite = obtenerFotoUsuario(usuarioLite);
    //bytesConfiguracion = obtenerFotoConfiguracion(configuracionUsuario);

    ResponsiveApp responsiveApp = ResponsiveApp(context);
    String dni = oUsuario.codUser.toString();
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
                              oUsuario.cdesUser.toString(),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: imagen64 != null
                          ? Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.white10),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1)),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(bytesConfiguracion,
                                          scale: 0.3),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 4, color: Colors.white),
                                        color: Colors.blue),
                                    child: GestureDetector(
                                      onTap: () {
                                        opciones(context);
                                        //print(photofile);
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          :  Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.white10),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1)),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(bytesUsuarioLite,
                                          scale: 0.3),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 4, color: Colors.white),
                                        color: Colors.blue),
                                    child: GestureDetector(
                                      onTap: () {
                                        opciones(context);
                                        //print(photofile);
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    //width: responsiveApp.wp(30),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        usuarioLite.dependencia.toString(),
                        textAlign: TextAlign.center,
                        style: fontStyle,
                      ),
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

  void pickMedia(ImageSource source) async {
    XFile file;
    final dbHelper = ConfiguracionBack.instance;
    int allRows = await dbHelper.queryRowCount();
    file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      setState(() {
        imagePath = file.path;
        imagen64 =
            "data:image/png;base64,${base64Encode(File(imagePath).readAsBytesSync())}";
        var x = "Imagen tomada-> $imagen64";
        var y = "Imagen de la base de datos -> ${usuarioLite.foto}";
        print(x);
        print(y);
        if (allRows == 0) {
          ConfiguracionUsuario configuracionUsuario =
              ConfiguracionUsuario(usuarioLite.DNI, imagen64);
          dbHelper.insert(configuracionUsuario);
          bytesConfiguracion =
              base64.decode(configuracionUsuario.foto.split(',').last);
          //guardar(imagePath.toString());
        } else {
          if (allRows == 1) {
            dbHelper.update(imagen64);
            //Obtener el usuario
          }
        }
      });
    }
  }

  Uint8List obtenerFotoUsuario(UsuarioLite usuarioLite) {
    Uint8List bytes = base64.decode(usuarioLite.foto.split(',').last);
    return bytes;
  }

  Uint8List obtenerFotoConfiguracion(
      ConfiguracionUsuario configuracionUsuario) {
    Uint8List bytes = base64.decode(configuracionUsuario.foto.split(',').last);
    return bytes;
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
                      pickMedia(ImageSource.camera);
                      Navigator.of(context).pop();
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
                      pickMedia(ImageSource.gallery);
                      Navigator.of(context).pop();
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

  guardar(String imagen) async {
    final dbHelper = DatabaseHelper.instance;
    UsuarioLite oUsuarioLite = UsuarioLite(oUsuario.cdesUser,
        usuarioLite.vUsuContrasenia, imagen, oUsuario.codUser, "");
    await dbHelper.insert(oUsuarioLite);
  }
}
