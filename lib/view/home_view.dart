// ignore_for_file: no_logic_in_create_state

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  HomeView({Key? key, this.oUsuario, this.usuarioLite}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState(oUsuario, usuarioLite);
}

class _HomeViewState extends State<HomeView> {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  _HomeViewState(this.oUsuario, this.usuarioLite);

  File? _image;

  _imgFromCamera() async {
    File? image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50)) as File?;

    setState(() {
      _image = image;
      _image as File;
    });
  }

  _imgFromGallery() async {
    File? image = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50)) as File?;

    setState(() {
      _image = image;
      _image as File;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String dni = oUsuario!.codUser.toString();
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
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
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          right: responsiveApp.dp(5),
                        ),
                        width: responsiveApp.wp(50),
                        child: CircleAvatar(
                          radius: responsiveApp.dp(30),
                          backgroundColor: Colors.white,
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
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
