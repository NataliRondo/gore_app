import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/view/widgets/numeros_widget.dart';

class SoporteTelefonico extends StatefulWidget {
  SoporteTelefonico({Key? key}) : super(key: key);

  @override
  State<SoporteTelefonico> createState() => _SoporteTelefonicoState();
}

class _SoporteTelefonicoState extends State<SoporteTelefonico> {
  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              "Números de soporte",
            ),
          ),
          backgroundColor: colorFondo,
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: SizedBox(
                      height: 55,
                      width: 250,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        //cursorColor: Colors.black38,
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: responsiveApp.dp(4),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          size: responsiveApp.dp(5.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsiveApp.hp(5),
              ),
              listaNumero(context, "51973438858", "", "Soporte de TI"),
            ],
          ),
        ),
      ),
    );
  }
}
