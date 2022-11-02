// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gore_app/data/loginDA.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/view/loginView.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/view/pantalla_principal.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _isLoading = true;
  @override

  
  void initState() {
    super.initState();
    
// 2. Future.delayed
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
        FocusScope.of(context).requestFocus(FocusNode());
      });
      loadWidget();
    });
  }

  loadWidget() async {
    final dbHelper = DatabaseHelper.instance;
    int? allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      UsuarioLite? oUsarioLite = await dbHelper.getUsuario();
      loginDA api = loginDA();
      Usuario oUsuario = await api.login(oUsarioLite!.DNI.toString(),
          oUsarioLite.vUsuContrasenia.toString(), context);
      if (oUsuario != null) {
        return await Future<Widget>.delayed(
            const Duration(seconds: 1), () => PantallaInicio(oUsuario: oUsuario, usuarioLite: oUsarioLite,));
      } else {
        return await Future<Widget>.delayed(
            const Duration(seconds: 1), () => const LoginView());
      }
    } else {
      return await Future<Widget>.delayed(
          const Duration(seconds: 1), () => const LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsive = ResponsiveApp(context);
    return Stack(
      children: [
        Image.asset(
          "src/splash_inicio.PNG",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: responsive.dp(150),
              bottom: responsive.dp(10),
            ),
            child: _isLoading
                ? Image.asset(
                    "src/loading.gif",
                    height: responsive.hp(15),
                    width: responsive.hp(15),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
