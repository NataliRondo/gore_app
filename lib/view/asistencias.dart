
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class AsistenciasView extends StatefulWidget {
  const AsistenciasView({Key? key}) : super(key: key);

  @override
  State<AsistenciasView> createState() => _AsistenciasViewState();
}

class _AsistenciasViewState extends State<AsistenciasView> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvent;

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
  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistencias'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Card(
          //elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blueGrey, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Calendar(
              initialDate: DateTime.now(),
              startOnMonday: true,
              selectedColor: Colors.blue,
              todayColor: Colors.red,
              eventColor: Colors.green,
              eventDoneColor: Colors.amber,
              bottomBarColor: Colors.deepOrange,
              onRangeSelected: (range) {
                print('selected Day ${range.from},${range.to}');
              },
              onDateSelected: (date) {
                return _handleData(date);
              },
              events: events,
              locale: "en_ES",
              isExpanded: true,
              dayOfWeekStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black12,
                fontWeight: FontWeight.w100,
              ),
              bottomBarTextStyle: const TextStyle(
                color: Colors.white,
              ),
              //hideBottomBar: true,
              //hideArrows: false,
              weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            ),
          ),
        ),
      ),
    );
  }
}
