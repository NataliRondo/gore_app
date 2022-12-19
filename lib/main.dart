// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api
// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
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
import 'package:gore_app/view/prueba.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:splashscreen/splashscreen.dart';

Future <void> main() async {
  
  //initializeDateFormatting().then((_) => runApp(const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  @override
  void initState() {
    super.initState();
    initPlataformState();
  }
  static const String oneSignalID = "d597d539-8967-43ab-85ee-4307b60bef58";
  Future<void> initPlataformState() async {
    OneSignal.shared.setAppId(oneSignalID);
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');

      setState(() {
        var noti =
            result.notification.jsonRepresentation().replaceAll("\\n", "\n");
        var notificacion = result.notification.rawPayload;
        
        print(result.notification.title);
        print(result.notification.body);
        print(result.notification.subtitle);
        print(result.notification.groupMessage);

        print("Opened notification: \n$notificacion");

        //notificacion.
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Prueba(
            notificacion: notificacion,
            noti: noti,
          ),
        ));
      });
    });
    
  }

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
