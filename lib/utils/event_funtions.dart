import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/models/event.dart';
import '/shared/loading.dart';
import '/utils/show_msg.dart';

void editAddEvent(BuildContext context, String groupRef, Event event,
    Event? prevEvent, bool newEvent,
    {bool replace = false}) async {
  if (event.eventName.trim().isEmpty ||
      event.date == null ||
      event.tag.trim().isEmpty) {
    showToast('Please enter event name, tag and date!');
    return;
  }

  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  if (!newEvent) {
    await fbase
        .collection('groups')
        .doc(groupRef)
        .collection('events')
        .doc(prevEvent!.eventId)
        .delete();
  }

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('events')
      .doc(event.eventId)
      .set(event.toJson());

  Navigator.pop(context);
  Navigator.pop(context);
  if (replace) {
    Navigator.pop(context);
  }

  showSnack(
    context,
    newEvent ? 'Event added!' : 'Event modified!',
    color: Colors.green,
  );
}

Future<Event?> checkDuplicateEvent(
  BuildContext context,
  String groupRef,
  Event event,
) async {
  loading(context);
  FirebaseFirestore fbase = FirebaseFirestore.instance;

  Event? duplicate;

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('events')
      .doc(event.eventId)
      .get()
      .then((value) {
    if (value.exists) {
      duplicate = Event(
        value['eventName'],
        value['tag'],
        DateTime.fromMicrosecondsSinceEpoch(
          value['date'].microsecondsSinceEpoch,
        ),
        value['info'],
        value['addedBy'],
      );
    }
  });

  Navigator.pop(context);
  return duplicate;
}

void deleteEvent(
  BuildContext context,
  String groupRef,
  Event event,
) async {
  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('events')
      .doc(event.eventId)
      .delete();

  Navigator.pop(context);
  Navigator.pop(context);

  showSnack(
    context,
    'Event deleted!',
    color: Colors.grey[300]!,
    textColor: Colors.red,
  );
}
