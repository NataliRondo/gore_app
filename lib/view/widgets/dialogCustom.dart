import 'package:flutter/material.dart';
import 'package:gore_app/data/sqlite/biometria_sql.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:quickalert/quickalert.dart';

Alerta(BuildContext context, BiometriaSQL dbHelperBio, String valor) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: _buildChild(context, dbHelperBio, valor),
  );
}

_buildChild(BuildContext context, BiometriaSQL dbHelperBio, String valor) =>
    Container(
      height: 350,
      decoration: BoxDecoration(
          color: RojoApp,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'src/alert.gif',
                height: 120,
                width: 120,
              ),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            '¿Quieres eliminar tu huella?',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Text(
              'Si presionó el botón por error, haga clic en No para continuar.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
                textColor: Colors.white,
                color: Colors.black54,
              ), //
              SizedBox(
                width: 8,
              ),
              MaterialButton(
                onPressed: () async {
                  int? allRows = await dbHelperBio.queryRowCount();
                  if (allRows == 0) {
                    Navigator.of(context).pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: "No hay huella registrada.",
                    );
                  } else {
                    dbHelperBio.delete(valor);
                    Navigator.of(context).pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: "Se elimino la huella con éxito.",
                    );
                  }
                },
                child: Text('Si'),
                color: Colors.white,
                textColor: RojoApp.withOpacity(0.5),
              ) //
            ],
          )
        ],
      ),
    );
