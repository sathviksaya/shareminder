import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../group_screen/events/events_by_date.dart';

class GroupTabView extends StatelessWidget {
  final String groupRef;
  const GroupTabView({Key? key, required this.groupRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: tab(context),
    );
  }

  Widget tab(BuildContext context) => DefaultTabController(
        initialIndex: 1,
        length: 3,
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
                    child: Text("All"),
                  ),
                  Tab(
                    child: Text("Today"),
                  ),
                  Tab(
                    child: Text("Tomorrow"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  EventsByDate(
                    groupRef: groupRef,
                  ),
                  EventsByDate(
                    date: DateTime.now(),
                    groupRef: groupRef,
                  ),
                  EventsByDate(
                    date: DateTime.now().add(const Duration(days: 1)),
                    groupRef: groupRef,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
