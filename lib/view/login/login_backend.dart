// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:gore_app/data/loginDA.dart';
import 'package:gore_app/data/sqlite/DatabaseHelper.dart';
import 'package:gore_app/models/UsuarioLite.dart';
import 'package:gore_app/models/usuario.dart';

abstract class LoginContract {
  void onLoginSuccess(Usuario user);
  void onLoginError(String errorTxt);
}

class LoginBackend {
  final LoginContract _view;
  loginDA api = loginDA();
  LoginBackend(this._view);

  doLogin(String username, String password, BuildContext context) async {
    try {
      Usuario oUsuario = await api.login(username, password, context);
      
      if (oUsuario != null) {
        final dbHelper = DatabaseHelper.instance;
        int? allRows = await dbHelper.queryRowCount();
        if (allRows == 0) {
          UsuarioLite oUsuarioLite = UsuarioLite(
            1,
            oUsuario.cdesUser,
            password,
            "",
            "",
            "src/usuario.png",
            oUsuario.codUser,
          );
          await dbHelper.insert(oUsuarioLite);
        }
        _view.onLoginSuccess(oUsuario);
      } else {
        _view.onLoginError("Error");
      }
      //_view.onLoginSuccess(oUsuario);
    } catch (e) {
      _view.onLoginError(e.toString().substring(e.toString().indexOf(":") + 1));
    }
  }
}
