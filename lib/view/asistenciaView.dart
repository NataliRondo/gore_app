// ignore_for_file: file_names, missing_return, unused_element, avoid_print, unused_field
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:gore_app/utils/colores.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AsistenciaView extends StatefulWidget {
  const AsistenciaView({Key key}) : super(key: key);

  @override
  State<AsistenciaView> createState() => _AsistenciaViewState();
}

class _AsistenciaViewState extends State<AsistenciaView> {
  DateTime _focusedDay;
  DateTime _selectedDay;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  List<CleanCalendarEvent> _selectedEvent;

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue.shade700),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  void _getEventsForDay(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvent = events[_selectedDay] ?? [];
    });
    print(_selectedDay);
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorFondo,
        title: const Text('Asistencias'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                color: const Color.fromARGB(255, 242, 249, 255),
                elevation: 5,
                child: TableCalendar(
                  selectedDayPredicate: (day) => _selectedDay == day,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      _selectedDay = selectedDay;
                    });
                    _selectedDay.day;
                    print(dateFormat.format(_selectedDay));
                  },
                  //locale: "es_ES",
                  focusedDay: _focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(const Duration(days: 30)),
                  eventLoader: (day) {
                    //return _getEventsForDay(day);
                    
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
