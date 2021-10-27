import 'package:intl/intl.dart';

class Event {
  late String eventName;
  late String tag;
  late DateTime? date;
  late String info;
  late String addedBy;
  late String eventId;

  Event(
    this.eventName,
    this.tag,
    this.date,
    this.info,
    this.addedBy,
  ) {
    eventId =
        date!.microsecondsSinceEpoch.toString() + '###' + addedBy;
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'eventId': eventId,
      'addedBy': addedBy,
      'date': date,
      'tag': tag,
      'info': info.trim(),
      'queryDate': DateFormat('dd-MM-y').format(date ?? DateTime.now()),
    };
  }
}
