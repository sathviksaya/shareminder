import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/models/copy_event.dart';
import '/models/event.dart';
import '/screens/group_screen/events/add_edit_event.dart';
import '/screens/group_screen/events/confirm_delete.dart';
import '/screens/widgets/dropdown_list.dart';
import '/utils/show_msg.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import "package:googleapis_auth/auth_io.dart";
// import 'package:googleapis/calendar/v3.dart' as calendar;

class EventCard extends StatelessWidget {
  final String groupRef;
  final Event event;
  const EventCard({
    Key? key,
    required this.groupRef,
    required this.event,
  }) : super(key: key);

  // static const _scopes = const [calendar.CalendarApi.calendarScope];
  // var _credentials;

  void _eventOption(BuildContext context, int flag) {
    showDialog(
      context: context,
      builder: (builder) {
        switch (flag) {
          case 0:
            return AddEditEvent(
              newEvent: false,
              groupRef: groupRef,
              event: event,
            );

          case 2:
            return ConfirmDeleteEvent(event: event, groupRef: groupRef);

          default:
            return Dialog(child: Container());
        }
      },
    );
  }

  // elevation: 20,
  // shadowColor: Colors.white38,
  // margin: const EdgeInsets.symmetric(
  //   horizontal: 10,
  //   vertical: 5,
  // ),
  // shape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(20),
  // ),

  @override
  Widget build(BuildContext context) {
    // return RoundedExpansionTile(
    //   noTrailing: true,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   title: mainEvent(context),
    //   children: [
    //     if (event.info.trim().isNotEmpty)
    //       Linkify(
    //         onOpen: (link) async {
    //           await launch(link.url);
    //         },
    //         text: event.info,
    //       ),
    //   ],
    // );

    // if (Platform.isAndroid) {
    //   _credentials = new ClientId(
    //       "412099770373-vlbvfi6mpphhjl5lfdi7a0thfduavfcn.apps.googleusercontent.com",
    //       "");
    // } else {
    //   _credentials = new ClientId(
    //       "412099770373-6r29ibl62po4d5pni9juppma7tconumk.apps.googleusercontent.com",
    //       "");
    // }

    // return ExpansionTile(

    //   title: mainEvent(context),
    //   children: [
    //     if (event.info.trim().isNotEmpty)
    //       Linkify(
    //         onOpen: (link) async {
    //           await launch(link.url);
    //         },
    //         text: event.info,
    //       ),
    //   ],
    // );

    return Card(
      elevation: 20,
      shadowColor: Colors.white38,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: mainEvent(context),
    );
  }

  Widget mainEvent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.eventName,
                      // softWrap: true,
                      overflow: TextOverflow.fade,
                      // maxLines: 1,
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      event.tag,
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              FilterMenu(
                options: eventMenu,
                optionIcons: eventMenuIcons,
                icon: Icons.more_horiz,
                onSelect: (choice) {
                  // FocusScope.of(context).requestFocus(new FocusNode());
                  switch (choice) {
                    case 'Edit':
                      _eventOption(context, 0);
                      break;
                    case 'Copy event':
                      CopiedEvent.event = event;
                      showToast("Event copied");
                      break;
                    case 'Add to Calendar':
                      _addToCalendar(event);
                      break;
                    case 'Delete event':
                      _eventOption(context, 2);
                      break;
                    default:
                      break;
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.jm().format(event.date!),
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMEd().format(event.date!),
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (event.info.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Linkify(
                  onOpen: (link) async {
                    await launch(link.url);
                  },
                  text: event.info,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _addToCalendar(Event event) async {
    var url = Uri.parse(
        'https://www.googleapis.com/calendar/v3/calendars/calendarId/events');
    await http.post(
      url,
      body: {
        'summary': event.eventName,
        'description': event.info.isEmpty ? 'No description' : event.info,
        'start': jsonEncode({
          'dateTime': '2021-09-02T10:00:00+05:30',
        }),
        'end': jsonEncode({
          'dateTime': '2021-09-02T14:00:00+05:30',
        }),
        // "anyoneCanAddSelf": jsonEncode(true),
      },
    );
    
    // calendar.Event event = calendar.Event();
    // event.summary = eve.eventName;
    // event.description = eve.info.isEmpty ? 'No description' : eve.info;

    // calendar.EventDateTime start = new calendar.EventDateTime();
    // start.dateTime = eve.date;
    // start.timeZone = "GMT+05:30";
    // event.start = start;

    // calendar.EventDateTime end = new calendar.EventDateTime();
    // end.timeZone = "GMT+05:30";
    // end.dateTime = eve.date;
    // event.end = end;
    // try {
    //   clientViaUserConsent(_credentials, _scopes, prompt)
    //       .then((AuthClient client) {
    //     var cal = calendar.CalendarApi(client);
    //     String calendarId = "primary";
    //     print( 
    //       'lallala'  +client.toString());
    //     cal.events.insert(event, calendarId).then((value) {
    //       print("ADDEDDD_________________${value.status}");
    //       if (value.status == "confirmed") {
    //         print('Event added in google calendar');
    //       } else {
    //         print("Unable to add event in google calendar");
    //       }
    //     });
    //   });
    // } catch (e) {
    //   print('Error creating event $e');
    // }
  }
}

// void prompt(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

List<String> eventMenu = [
  'Edit',
  'Copy event',
  'Add to Calendar',
  'Delete event',
];

Map<String, List> eventMenuIcons = {
  'Edit': [
    Icons.edit,
    Colors.black87,
  ],
  'Copy event': [
    Icons.content_copy,
    Colors.black87,
  ],
  'Add to Calendar': [
    Icons.calendar_today,
    Colors.black87,
  ],
  'Delete event': [
    Icons.delete,
    Colors.red[300],
  ],
};
