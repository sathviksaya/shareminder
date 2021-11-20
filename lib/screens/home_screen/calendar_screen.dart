import 'package:flutter/material.dart';
import 'calendar.dart';
import 'calendar_events.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Calendar(),
        CalendarEvents(),
      ],
    );
  }
}
