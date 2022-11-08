// ignore_for_file: no_logic_in_create_state, import_of_legacy_library_into_null_safe
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/configuracion.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/configuracion.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/perfil_usuario.dart';
import 'package:gore_app/view/widgets/menu.dart';
import 'package:gore_app/view/widgets/menu2.dart';

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
  bool datos = false;

  @override
  void initState() {
    if(configuracionUsuario == null){
      obtenerDatos();
    }
    super.initState();
  }

  obtenerDatos() async {
    final dbHelper = ConfiguracionBack.instance;
    int? allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      configuracionUsuario = await dbHelper.getUsuarioConfiguracion();
      datos = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return configuracionUsuario != null
        ? Scaffold(
            key: keyScaffold,
            appBar: AppBar(
              backgroundColor: colorFondo,
              leading: IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: const Icon(Icons.menu),
                onPressed: () async {
                  keyScaffold.currentState!.openDrawer();
                  obtenerDatos();
                },
              ),
            ),
            drawer: menuDrawer(
                context,
                oUsuario!.foto.toString(),
                oUsuario!.cdesUser.toString(),
                oUsuario!.codUser.toString(),
                configuracionUsuario!),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                obtenerDatos();
              },
              child: PerfilUsuario(
                oUsuario: oUsuario,
                usuarioLite: usuarioLite,
              ),
            ),
          )
        : Scaffold(
            key: keyScaffold,
            appBar: AppBar(
              backgroundColor: colorFondo,
              leading: IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: const Icon(Icons.menu),
                onPressed: () async {
                  keyScaffold.currentState!.openDrawer();
                  if (configuracionUsuario != null) {
                    obtenerDatos();
                  }
                },
              ),
            ),
            drawer: datos == false
                ? menu2(
                    context,
                    oUsuario!.foto.toString(),
                    oUsuario!.cdesUser.toString(),
                    oUsuario!.codUser.toString(),
                  )
                : menuDrawer(
                    context,
                    oUsuario!.foto.toString(),
                    oUsuario!.cdesUser.toString(),
                    oUsuario!.codUser.toString(),
                    configuracionUsuario!),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                if (configuracionUsuario != null) {
                  obtenerDatos();
                }
              },
              child: PerfilUsuario(
                oUsuario: oUsuario,
                usuarioLite: usuarioLite,
              ),
            ),
          );
  }
}
