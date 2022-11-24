// ignore_for_file: file_names, missing_return, unused_element, avoid_print, unused_field, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:gore_app/data/servicio_asistencia.dart';
import 'package:gore_app/models/usuario.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:gore_app/view/listaAsistencias.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AsistenciaView extends StatefulWidget {
  Usuario? usuario;
  AsistenciaView({Key? key, this.usuario}) : super(key: key);

  @override
  State<AsistenciaView> createState() => _AsistenciaViewState(usuario);
}

class _AsistenciaViewState extends State<AsistenciaView> {
  Usuario? usuario;
  _AsistenciaViewState(this.usuario);

  DateTime? _focusedDay;
  DateTime? _selectedDay;
  String? fecha;

  ServicioAsistencia servicioAsistencia = ServicioAsistencia();

  @override
  void initState() {
    super.initState();
    setState(() {
      _focusedDay = DateTime.now();
      _selectedDay = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            "Mis Marcaciones",
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
                  locale: 'ES',

                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextFormatter: (date, locale) =>
                          DateFormat.yMMMM(locale).format(date).toCapitalize()),
                  selectedDayPredicate: (day) => _selectedDay == day,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      _selectedDay = selectedDay;
                      fecha = DateFormat('yyy-MM-dd')
                          .format(_selectedDay!)
                          .replaceAll("-", "");
                    });
                    print(fecha);
                  },
                  focusedDay: _focusedDay!,
                  firstDay: DateTime.utc(
                      DateTime.now().year, DateTime.now().month, 1),
                  lastDay: DateTime.now().add(const Duration(days: 30)),
                ),
              ),
            ),
            ListaAsistencias(
              usuario: usuario,
              day: fecha.toString(),
            )
          ],
        ),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
