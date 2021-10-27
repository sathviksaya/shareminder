import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/screens/group_screen/group_screen.dart';
import '/utils/page_surf.dart';

class GroupCard extends StatelessWidget {
  final String groupName;
  final String groupId;
  final String description;
  final String extension;
  final int eventsNumber;
  const GroupCard({
    Key? key,
    required this.groupName,
    required this.description,
    required this.eventsNumber,
    required this.extension,
    required this.groupId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String eventsToday;
    if (eventsNumber == 0) {
      eventsToday = "No events for today..";
    } else if (eventsNumber == 1) {
      eventsToday = "$eventsNumber Event for today..";
    } else {
      eventsToday = "$eventsNumber Events for today..";
    }

    return GestureDetector(
      onTap: () {
        pushPage(
          context,
          GroupScreen(
            groupId: groupId,
            groupName: groupName,
            extension: extension,
          ),
        );
      },
      child: Card(
        elevation: 20,
        shadowColor: Colors.white38,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupName,
                    maxLines: 1,
                    softWrap: false,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "$description\n",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    eventsToday,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:
                          eventsNumber == 0 ? Colors.grey : Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
