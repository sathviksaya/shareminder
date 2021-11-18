import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import '/models/event.dart';
import '/screens/widgets/event_card.dart';

class EventsByDate extends StatelessWidget {
  final DateTime? date;
  final String groupRef;
  EventsByDate({
    Key? key,
    this.date,
    required this.groupRef,
  }) : super(key: key);

  final FirebaseFirestore fbase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: date != null
          ? fbase
              .collection('groups')
              .doc(groupRef)
              .collection('events')
              .where(
                'queryDate',
                isEqualTo: DateFormat('dd-MM-y').format(
                  date ?? DateTime.now(),
                ),
              )
              .snapshots()
          : fbase
              .collection('groups')
              .doc(groupRef)
              .collection('events')
              .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError) {
          return const Center(
            child: SpinKitFadingCircle(
              size: 20,
              color: Colors.white38,
            ),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No events..',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 14,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (itemBuilder, index) {
            var data = snapshot.data!.docs[index];
            Event event = Event(
              data['eventName'],
              data['tag'],
              DateTime.fromMicrosecondsSinceEpoch(
                data['date'].microsecondsSinceEpoch,
              ),
              data['info'],
              data['addedBy'],
            );
            return EventCard(groupRef: groupRef, event: event);
          },
        );
      },
    );
  }
}
