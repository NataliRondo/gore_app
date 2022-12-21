
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:intl/intl.dart';

detallePush(BuildContext context, String notificacion, String detalle,
    int setTime, String registrado) {
  var milliSeconds = setTime;
  var date1 = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
  print(date1); //2022-12-20 09:46:57.986
  var fechaRegistro = DateFormat('dd-MM-yyyy kk:mm:s a').format(date1);
  //Uint8List? bytesImage = Base64Decoder().convert((detalle));
  // print(bytesImage);
  

  return Scaffold(
    appBar: AppBar(
      title: Text(
        notificacion,
        style: const TextStyle(fontSize: 15),
      ),
      backgroundColor: colorFondo,
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.arrow_back),
        onPressed: () async {
          Navigator.pop(context);
          //FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
        child: Column(
          children: [
            Center(
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      fechaRegistro,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      registrado,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.right,
                    )
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Center(
                  child: Text(
                notificacion,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Html(
                      data:
                          detalle),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
