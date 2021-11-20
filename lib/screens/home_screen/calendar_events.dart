import 'package:flutter/material.dart';

class CalendarEvents extends StatelessWidget {
  const CalendarEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.44,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 300,
            ),
            Container(
              color: Colors.green,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
