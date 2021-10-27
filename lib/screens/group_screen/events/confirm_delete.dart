import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/models/event.dart';
import '/screens/widgets/dialog_head.dart';
import '/utils/event_funtions.dart';

class ConfirmDeleteEvent extends StatelessWidget {
  final Event event;
  final String groupRef;
  const ConfirmDeleteEvent({
    Key? key,
    required this.event,
    required this.groupRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DialogHead(
                heading: 'Delete event',
              ),
              const SizedBox(
                height: 10,
              ),
              showWarning(),
              const SizedBox(
                height: 10,
              ),
              showDate(),
              const SizedBox(
                height: 10,
              ),
              button(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context) {
    return TextButton(
      onPressed: () async {
        deleteEvent(context, groupRef, event);
      },
      child: Text(
        'Yes',
        style: TextStyle(
          fontSize: 15,
          color: Colors.red[300],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget showWarning() => Column(
        children: [
          const Text(
            'Are you sure you want to delete the event',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            event.eventName + '?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              // color: Colors.red[300],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );

  Widget showDate() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
      );
}
