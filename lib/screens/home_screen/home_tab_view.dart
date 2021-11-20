import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareminder/screens/home_screen/calendar_screen.dart';

import 'display_groups.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: tab(context),
    );
  }

  Widget tab(BuildContext context) => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                labelColor: Colors.white,
                indicatorPadding: const EdgeInsets.all(10),
                labelPadding: const EdgeInsets.all(5),
                unselectedLabelColor: Colors.grey,
                labelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                ),
                unselectedLabelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                ),
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13),
                ),
                tabs: const [
                  Tab(
                    child: Text("Calendar"),
                  ),
                  Tab(
                    child: Text("Groups"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  CalendarScreen(),
                  DisplayGroups(),
                ],
              ),
            ),
          ],
        ),
      );
}
