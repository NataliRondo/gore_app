// ignore_for_file: no_logic_in_create_state, must_be_immutable, missing_return
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_asistencia.dart';
import 'package:gore_app/models/asistencias.dart';
import 'package:gore_app/models/dia.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/utils/variables.dart';
import 'package:gore_app/view/listaAsistencias.dart';
import 'package:gore_app/view/widgets/asistencia_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class Prueba extends StatefulWidget {
  Usuario usuario;
  Prueba({Key key, this.usuario}) : super(key: key);

  @override
  State<Prueba> createState() => _PruebaState(usuario);
}

class _PruebaState extends State<Prueba> {
  Usuario usuario;
  _PruebaState(this.usuario);

  DateTime _focusedDay;
  DateTime _selectedDay;
  

  ServicioAsistencia servicioAsistencia = ServicioAsistencia();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    String dni = usuario.codUser;
    String token = usuario.token;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            "Asistencias",
          ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
              child: Card(
                color: const Color.fromARGB(255, 242, 249, 255),
                elevation: 3,
                child: TableCalendar(
                  selectedDayPredicate: (day) => _selectedDay == day,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      _selectedDay = selectedDay;
                    });
                    _selectedDay.day;
                    //print(dateFormat.format(_selectedDay));
                  },
                  //locale: "es_ES",
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(DateTime.now().year, DateTime.now().month, 1),
                  lastDay: DateTime.now().add(const Duration(days: 30)),
                ),
              ),
            ),
            ListaAsistencias(usuario: usuario,day: _selectedDay,)
          ],
        ),
      ),
    );
  }
}
