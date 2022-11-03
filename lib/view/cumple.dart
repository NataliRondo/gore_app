import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/lista_cumple.dart';

class Cumple extends StatefulWidget {
  const Cumple({Key? key}) : super(key: key);

  @override
  State<Cumple> createState() => _CumpleState();
}

class _CumpleState extends State<Cumple> {
  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text("Cumpleaños de día",),
        )),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: responsiveApp.dp(76), top: 15),
                        child: const Text(
                          "Hoy",
                          textAlign: TextAlign.right,
                        ),
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        children: [
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: responsiveApp.dp(76), top: 5),
                        child: const Text(
                          "Mañana",
                          textAlign: TextAlign.right,
                        ),
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 15,
                        ),
                        children: [
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: responsiveApp.dp(76), top: 5),
                        child: const Text(
                          "Ayer",
                          textAlign: TextAlign.right,
                        ),
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 15,
                        ),
                        children: [
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                          tarjetaCumple(context, "Jorge Manrique Flores",
                              fontStyleCumple),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
