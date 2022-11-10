// ignore_for_file: no_logic_in_create_state, import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/configuracion.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/configuracion.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/perfil_usuario.dart';
import 'package:gore_app/view/widgets/menu.dart';
// ignore: must_be_immutable
class PantallaInicio extends StatefulWidget {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  ConfiguracionUsuario? configuracionUsuario;
  PantallaInicio(
      {Key? key, this.oUsuario, this.usuarioLite, this.configuracionUsuario})
      : super(key: key);

  @override
  State<PantallaInicio> createState() =>
      _PantallaInicioState(oUsuario, usuarioLite, configuracionUsuario);
}

class _PantallaInicioState extends State<PantallaInicio> {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  ConfiguracionUsuario? configuracionUsuario;
  Uint8List? bytesConfiguracion;

  _PantallaInicioState(
      this.oUsuario, this.usuarioLite, this.configuracionUsuario);

  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();
  Key _key = UniqueKey();
  bool datos = false;
  String? fotoGuardada;

  @override
  void initState() {
    _handleLocalChanged();
    super.initState();
    if (configuracionUsuario != null || configuracionUsuario == null) {
      obtenerDatos();
    }
  }

  void _handleLocalChanged() => setState(() {
        _key = UniqueKey();
      });

  obtenerDatos() async {
    final dbHelper = ConfiguracionBack.instance;
    int? allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      configuracionUsuario = await dbHelper.getUsuarioConfiguracion();
      datos = true;
      fotoGuardada = configuracionUsuario!.foto!;
      bytesConfiguracion = base64.decode(fotoGuardada!.split(',').last);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);

    Uint8List bytes = base64.decode(oUsuario!.foto!.split(',').last);

    var scaffold = Scaffold(
      key: keyScaffold,
      appBar: AppBar(
        backgroundColor: colorFondo,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () async {
            setState(() {});
            keyScaffold.currentState!.openDrawer();
            obtenerDatos();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: responsiveApp.wp(60),
              child: DrawerHeader(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: colorFondo,
                ),
                child: Column(
                  children: [
                    SizedBox(
                        //padding: EdgeInsets.only(right: responsiveApp.dp(10)),
                        width: responsiveApp.wp(30),
                        height: responsiveApp.wp(30),
                        child: fotoGuardada != null
                            ? CircleAvatar(
                                radius: responsiveApp.dp(30),
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: responsiveApp.dp(25),
                                  //child: Image.memory(bytes),
                                  backgroundImage: MemoryImage(
                                      bytesConfiguracion!,
                                      scale: 0.3),
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            : CircleAvatar(
                                radius: responsiveApp.dp(30),
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: responsiveApp.dp(25),
                                  //child: Image.memory(bytes),
                                  backgroundImage:
                                      MemoryImage(bytes, scale: 0.3),
                                  backgroundColor: Colors.transparent,
                                ),
                              )),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: responsiveApp.dp(3),
                            right: responsiveApp.dp(8)),
                        width: responsiveApp.wp(50),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              oUsuario!.cdesUser!,
                              //oUsuario.persona.vPerApellidos,
                              textAlign: TextAlign.right,
                              style: fontStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            menuDrawer(context, oUsuario!)
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          obtenerDatos();
          //setState(() {});
        },
        child: PerfilUsuario(
          oUsuario: oUsuario,
          usuarioLite: usuarioLite,
        ),
      ),
    );
    return scaffold;
  }
}
