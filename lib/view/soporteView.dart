// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/widgets/soporte_widget.dart';

class SoporteView extends StatefulWidget {
  const SoporteView({Key? key}) : super(key: key);

  @override
  State<SoporteView> createState() => _SoporteViewState();
}

class _SoporteViewState extends State<SoporteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FondoApp,
      appBar: AppBar(
        title: const Text("Soporte Técnico SGTI"),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: tarjetaSoporte(context))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
