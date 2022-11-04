// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/view/login/login_backend.dart';
import 'package:gore_app/view/pantalla_principal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> implements LoginContract {
  @override
  void initState() {
    super.initState();
    //autoLogIn();
  }

  TextStyle style = const TextStyle(fontFamily: 'Lato', fontSize: 14.0);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String? username, password;
  late LoginBackend _presenter;
  final passHolder = TextEditingController();
  final uidHolder = TextEditingController();

  void autoLogIn() async {
    final dbHelper = DatabaseHelper.instance;
    int? allRows = await dbHelper.queryRowCount();
    if (allRows == 1) {
      UsuarioLite? oUsarioLite = await dbHelper.getUsuario();
      username = oUsarioLite!.vUsuNick.toString();
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

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsive = ResponsiveApp(context);
    final usuarioField = TextField(
      //inputFormatters: formatters,
      //textInputAction: TextInputAction.continueAction,
      controller: uidHolder,
      onChanged: (val) => username = val,
      keyboardType: TextInputType.name,
      obscureText: false,
      //autofocus: true,
      style: style,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.blueGrey),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Usuario",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passHolder,
      onChanged: (val) => password = val,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Contraseña",
          labelStyle: const TextStyle(color: Colors.blueGrey),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: colorFondo,
      child: MaterialButton(
        minWidth: responsive.wp(40),
        //padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //onPressed: _submit,
        onPressed:() {
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
                  usuarioField,
                  const SizedBox(height: 25.0),
                  passwordField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  const SizedBox(
                    height: 15.0,
                  ),
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
    showInSnackBar("Ingrese un usuario y/o contraseña válidos");
  }

  @override
  Future<void> onLoginSuccess(Usuario user) async {
    //showInSnackBar("Ingresando..");
    //Navigator.of(_ctx).pushReplacementNamed("/home");
    Navigator.of(context).pushReplacement(//new
        MaterialPageRoute(
            settings: const RouteSettings(name: '/home'), //new
            builder: (context) => PantallaInicio(oUsuario: user,) //new
            ));
  }
}
