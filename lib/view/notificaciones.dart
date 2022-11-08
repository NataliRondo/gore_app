// ignore_for_file: unused_field, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/responsive.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/widgets/lista_notificacion.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({Key? key}) : super(key: key);

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveApp = ResponsiveApp(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificaciones"),
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
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: responsiveApp.dp(76), bottom: 10, top: 5),
                    child: const Text(
                      "Hoy",
                      textAlign: TextAlign.right,
                    ),
                  ),
                  notificacion(
                      context,"src/ban.png",
                      "Sub Gerencia de Recursos Humanos",
                      fontStyleCumple,
                      "El 6 de OCtubre se suspenden las actividades ..."),
                  notificacion(
                      context,"src/logo_region.png",
                      "Sub Gerencia de Recursos Humanos",
                      fontStyleCumple,
                      "El 6 de OCtubre se suspenden las actividades ..."),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Notifi extends StatefulWidget {
  const Notifi({super.key});

  @override
  State<Notifi> createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: const Text('BottomNavigationBar Sample'),
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
        body: Bar()
        /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),*/
        );
  }
}
