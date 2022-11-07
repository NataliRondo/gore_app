// ignore_for_file: no_logic_in_create_state, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/perfil_usuario.dart';
import 'package:gore_app/view/widgets/menu.dart';
import 'package:new_version/new_version.dart';

// ignore: must_be_immutable
class PantallaInicio extends StatefulWidget {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;
  PantallaInicio({Key? key, this.oUsuario, this.usuarioLite}) : super(key: key);

  @override
  State<PantallaInicio> createState() =>
      _PantallaInicioState(oUsuario, usuarioLite);
}

class _PantallaInicioState extends State<PantallaInicio> {
  Usuario? oUsuario;
  UsuarioLite? usuarioLite;

  _PantallaInicioState(this.oUsuario, this.usuarioLite);

  GlobalKey<ScaffoldState> keyScaffold = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      appBar: AppBar(
        backgroundColor: colorFondo,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () async {
            keyScaffold.currentState!.openDrawer();
          },
        ),
      ),
      drawer: menuDrawer(context, oUsuario!.foto.toString(), oUsuario!.cdesUser.toString()),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: PerfilUsuario(oUsuario: oUsuario, usuarioLite: usuarioLite),
      ),
    );
  }
}
