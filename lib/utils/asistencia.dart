import 'dart:collection';

import 'package:gore_app/utils/utils.dart';

class Asistencia {
  final String title;

  const Asistencia(this.title);

  @override
  String toString() => title;
}
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}


final kEvents = LinkedHashMap<DateTime, List<Asistencia>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = { for (var item in List.generate(10, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 6) : List.generate(
        item % 6 + 1, (index) => Asistencia('Asistencia $item | ${index + 1}')) }
  ..addAll({
    kToday: [
      const Asistencia('Hoy Entrada: 8:00 am\' Salida:1:00 pm'),
      const Asistencia('Hoy Entrada: 8:00 am\' Salida:1:00 pm'),
    ],
  });

  List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
