// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, file_names, dead_code
//@dart=2.9
import 'package:flutter/material.dart';
import 'package:gore_app/data/services_biometria/auth.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/data/sqlite/biometria_sql.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/biometria_sql.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/inputLogin.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/login/login_backend.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gore_app/view/pantalla_principal.dart';
import 'package:gore_app/view/widgets/password_widget.dart';
import 'package:quickalert/quickalert.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> implements LoginContract {
  String valorHuella = "";
  @override
  void initState() {
    obtenerValor();
    super.initState();

    //autoLogIn();
  }

  void obtenerValor() async {
    final dbHelperBio = BiometriaSQL.instance;
    int allRowsBio = await dbHelperBio.queryRowCount();
    if (allRowsBio == 1) {
      setState(() {
        valorHuella = "1";
      });
    } else {
      setState(() {
        valorHuella = "0";
      });
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String username, password;
  LoginBackend _presenter;
  double _elementsOpacity = 1;
  final passHolder = TextEditingController();
  final uidHolder = TextEditingController();
  

  void autoLogIn() async {
    final dbHelper = DatabaseHelper.instance;
    int allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      UsuarioLite oUsarioLite = await dbHelper.getUsuario();
      username = oUsarioLite.vUsuNick.toString();
      password = oUsarioLite.vUsuContrasenia.toString();
      _submit();
      //Obtener el usuario
    }
  }

  _LoginView() {
    _presenter = LoginBackend(this);
  }

  void _submit() {
    //_presenter.doLogin(username.toString(), password.toString());

    _presenter.doLogin(uidHolder.text, passHolder.text, context);
  }

  void _submitBio() async {
    //_presenter.doLogin(username.toString(), password.toString());
    final dbHelperBio = BiometriaSQL.instance;
    int allRowsBio = await dbHelperBio.queryRowCount();
    if (allRowsBio == 1) {
      Biometriasql biometriasql = await dbHelperBio.getUsuarioBio();
      username = biometriasql.dni;
      password = biometriasql.password;
      _presenter.doLogin(username, password, context);
    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text:
              "LA AUTENTICACIÓN FALLO.\n Primero tiene que registrar su huella.");
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsive = ResponsiveApp(context);
    //usuarioField = inputLogin(uidHolder, false, "Usuario", username!, style);

    //final passwordField = inputLogin(passHolder, true, "Contraseña", password!, style);
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: colorFondo,
      child: MaterialButton(
        minWidth: responsive.wp(40),
        onPressed: () {
          //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => PantallaInicio())), (Route<dynamic> route) => false,);
          _submit();
        },
        child: Text(
          "Ingresar",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: responsive.dp(4)),
        ),
      ),
    );
    var desbloqueo = Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          SizedBox(
            width: responsive.wp(responsive.isTablet ? 15 : 12),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Desbloquear con biometría',
              style: TextStyle(
                  fontSize: responsive.dp(responsive.isTablet ? 2 : 4),
                  fontWeight: FontWeight.bold,
                  color: AzulApp,
                  fontFamily: "Lato"),
            ),
          ),
          IconButton(
            //padding:  EdgeInsets.only(left: tam),
            onPressed: () async {
              bool isAuthenticated = await AuthService.authenticateUser();
              if (isAuthenticated) {
                _submitBio();
              }
            },
            icon: const Icon(Icons.fingerprint),
          ),
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.0,
                    child: Image.asset(
                      "src/logo_region.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 45.0),
                  inputLogin(uidHolder, false, "Usuario", username, style),
                  const SizedBox(height: 25.0),
                  PasswordField(
                      passwordController: passHolder,
                      fadePassword: _elementsOpacity == 0),
                  //inputLogin(passHolder, true, "Contraseña", password, style),
                  const SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  const SizedBox(
                    height: 5.0,
                  ),
                  valorHuella == "0" ? Container() : desbloqueo
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    //scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    username = "";
    password = "";
    uidHolder.clear();
    passHolder.clear();
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: "Ingrese un usuario y/o contraseña válidos");
    //showInSnackBar("Ingrese un usuario y/o contraseña válidos");
  }

  @override
  Future<void> onLoginSuccess(Usuario user) async {
    //showInSnackBar("Ingresando..");
    //Navigator.of(_ctx).pushReplacementNamed("/home");
    Navigator.of(context).pushReplacement(//new
        MaterialPageRoute(
            settings: const RouteSettings(name: '/home'), //new
            builder: (context) => PantallaInicio(
                  oUsuario: user,
                ) //new
            ));
  }
}
