// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, no_logic_in_create_state, deprecated_member_use, unnecessary_null_comparison, prefer_typing_uninitialized_variables, avoid_print
// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  ConfiguracionUsuario configuracionUsuario;
  PerfilUsuario(
      {Key key, this.oUsuario, this.usuarioLite, this.configuracionUsuario})
      : super(key: key);

  @override
  _PerfilUsuarioState createState() =>
      _PerfilUsuarioState(oUsuario, usuarioLite, configuracionUsuario);
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  Usuario oUsuario;
  UsuarioLite usuarioLite;
  ConfiguracionUsuario configuracionUsuario;

  _PerfilUsuarioState(
      this.oUsuario, this.usuarioLite, this.configuracionUsuario);

  bool flag = true;
  String imagePath;
  String imagen64;
  Uint8List bytesConfiguracion;
  String foto;
  String dni;

  @override
  void initState() {
    setState(() {
      if (configuracionUsuario == null) {
        obtenerDatos();
      }
    });

    super.initState();

    final newVersion = NewVersion(
      androidId: 'com.snapchat.android',
    );

    Timer(const Duration(milliseconds: 800), () {
      checkNewVersion(newVersion);
    });

    //super.initState();
  }

  void checkNewVersion(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      if (status.canUpdate) {
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
      configuracionUsuario = await dbHelper.getUsuarioConfiguracion();
      bytesConfiguracion =
          base64.decode(configuracionUsuario.foto.split(',').last);
      foto = configuracionUsuario.foto;
      setState(() {});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    Uint8List bytesUsuario = obtenerFotoUsuario(oUsuario);

    ResponsiveApp responsiveApp = ResponsiveApp(context);
    dni = oUsuario.codUser.toString();
    return configuracionUsuario != null
        ? Scaffold(
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
                            padding:
                                EdgeInsets.only(right: responsiveApp.dp(3)),
                            width: responsiveApp.wp(50),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    oUsuario.cdesUser.toString(),
                                    textAlign: TextAlign.right,
                                    style: fontStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "",
                                    textAlign: TextAlign.right,
                                    style: fontStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
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
                                                color: Colors.black
                                                    .withOpacity(0.1)),
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(imagePath)),
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
                                                  width: 4,
                                                  color: Colors.white),
                                              color: Colors.blue),
                                          child: GestureDetector(
                                            onTap: () {
                                              opciones(context);
                                              //print(photofile);
                                              //setState(() {});
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
                                : Stack(
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
                                                color: Colors.black
                                                    .withOpacity(0.1)),
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                MemoryImage(bytesConfiguracion),
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
                                                  width: 4,
                                                  color: Colors.white),
                                              color: Colors.blue),
                                          child: GestureDetector(
                                            onTap: () {
                                              opciones(context);
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
                              oUsuario.dependencia.toString(),
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
          )
        : Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
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
                              padding:
                                  EdgeInsets.only(right: responsiveApp.dp(3)),
                              width: responsiveApp.wp(50),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      //"Natali",
                                      oUsuario.cdesUser.toString(),
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
                                                  color: Colors.black
                                                      .withOpacity(0.1)),
                                            ],
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(File(imagePath)),
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
                                                    width: 4,
                                                    color: Colors.white),
                                                color: Colors.blue),
                                            child: GestureDetector(
                                              onTap: () {
                                                opciones(context);
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
                                  : foto != null
                                      ? Stack(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Colors.white10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.black
                                                          .withOpacity(0.1)),
                                                ],
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(
                                                      bytesConfiguracion),
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
                                                        width: 4,
                                                        color: Colors.white),
                                                    color: Colors.blue),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    opciones(context);
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
                                      : Stack(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Colors.white10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.black
                                                          .withOpacity(0.1)),
                                                ],
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(bytesUsuario,
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
                                                        width: 4,
                                                        color: Colors.white),
                                                    color: Colors.blue),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    opciones(context);
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
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                oUsuario.dependencia.toString(),
                                textAlign: TextAlign.center,
                                style: fontStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    bottom: responsiveApp.dp(5),
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
    file = await ImagePicker().pickImage(source: source, maxHeight: 1020, maxWidth: 1020);
    if (file != null) {
      setState(() {
        imagePath = file.path;
        imagen64 =
            "data:image/png;base64,${base64Encode(File(imagePath).readAsBytesSync())}";
        var x = "Imagen tomada-> $imagen64";
        print(x);
        if (allRows == 0) {
          ConfiguracionUsuario configuracionUsuario =
              ConfiguracionUsuario(dni, imagen64);
          dbHelper.insert(configuracionUsuario);
          bytesConfiguracion =
              base64.decode(configuracionUsuario.foto.split(',').last);
        } else {
          if (allRows == 1) {
            ConfiguracionUsuario configuracionUsuario =
                ConfiguracionUsuario(dni, imagen64);
            dbHelper.update(dni, configuracionUsuario);
            bytesConfiguracion =
                base64.decode(configuracionUsuario.foto.split(',').last);
          }
        }
      });
    }
    setState(() {});
  }

  Uint8List obtenerFotoUsuario(Usuario oUsuario) {
    Uint8List bytes = base64.decode(oUsuario.foto.split(',').last);
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
                      setState(() {});
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
}
