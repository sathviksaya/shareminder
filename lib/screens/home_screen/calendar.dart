import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: CalendarCarousel(
        // whole
        height: MediaQuery.of(context).size.height * 0.34,
        selectedDateTime: DateTime.now(),
        childAspectRatio: 1.5,
        thisMonthDayBorderColor: Colors.transparent,

        // month header
        headerMargin: const EdgeInsets.all(10.0),
        headerTitleTouchable: true,
        headerTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),

        // week header
        weekFormat: false,
        weekDayPadding: const EdgeInsets.all(10.0),
        showWeekDays: true,
        weekdayTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        // days
        daysHaveCircularBorder: true,
        selectedDayButtonColor: Colors.black,
        selectedDayBorderColor: Colors.black,
        weekendTextStyle: const TextStyle(
          color: Colors.red,
        ),
        daysTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        // markedDatesMap: _markedDateMap,

        // functions
        pageScrollPhysics: const NeverScrollableScrollPhysics(),
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          // if (day.day == 15) {
          //   return const Center(
          //     child: Icon(Icons.local_airport),
          //   );
          // } else {
          //   return null;
          // }
        },
        // onHeaderTitlePressed: () => _selectDateFromPicker(),
        // onDayPressed: (DateTime date, List<Event> events) {
        //   this.setState(() => _currentDate = date);
        // },
      ),
    );
  }
}
