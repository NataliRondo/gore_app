// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gore_app/data/loginDA.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/data/sqlite/configuracion.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/configuracion.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/routes.dart';
import 'package:gore_app/view/loginView.dart';
import 'package:gore_app/view/pantalla_principal.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  
  //initializeDateFormatting().then((_) => runApp(const MyApp()));
  initializeDateFormatting().then((_) =>runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

//class MyApp extends StatelessWidget {
class _MyAppState extends State<MyApp> {
  loadWidget() async {
    final dbHelper = DatabaseHelper.instance;
    final dbHelperConf = ConfiguracionBack.instance;
    int allRows = await dbHelper.queryRowCount();
    int allRowsConf = await dbHelperConf.queryRowCount();
    if (allRows == 1) {
      UsuarioLite oUsarioLite = await dbHelper.getUsuario();
      ConfiguracionUsuario configuracionUsuario =
          await dbHelperConf.getUsuarioConfiguracion();
      loginDA api = loginDA();
      // ignore: use_build_context_synchronously
      Usuario oUsuario = await api.login(oUsarioLite.DNI.toString(),
          oUsarioLite.vUsuContrasenia.toString(), context);
      if (oUsuario != null) {
        if (allRowsConf == 1) {
          return await Future<Widget>.delayed(
              const Duration(seconds: 1),
              () => PantallaInicio(
                    oUsuario: oUsuario,
                    usuarioLite: oUsarioLite,
                    configuracionUsuario: configuracionUsuario,
                  ));
        }
        return await Future<Widget>.delayed(
            const Duration(seconds: 1),
            () => PantallaInicio(
                  oUsuario: oUsuario,
                  usuarioLite: oUsarioLite,
                ));
      } else {
        return await Future<Widget>.delayed(
            const Duration(seconds: 4), () => const AfterSplash());
      }
    } else {
      return await Future<Widget>.delayed(
          const Duration(seconds: 4), () => const AfterSplash());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        imageBackground: const AssetImage("src/splash_inicio.PNG"),
        navigateAfterFuture: loadWidget(),
        //loaderColor: Colors.white,
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      routes: routes,
    );
  }
}
