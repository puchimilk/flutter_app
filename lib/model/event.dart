class Event {
  const Event({
    this.id,
    required this.summary,
    this.description,
    required this.created,
    this.updated,
    this.location,
    required this.colorId,
    required this.startDate,
    this.endDate,
    required this.isAllDay,
  });

  final int? id;
  final String summary;
  final String? description;
  final DateTime created;
  final DateTime? updated;
  final String? location;
  final int colorId;
  final DateTime startDate;
  final DateTime? endDate;
  final bool isAllDay;

  Map<String, dynamic> toMap() => <String, dynamic>{
    'summary': summary,
    'description': description,
    'created': created.toString(),
    'updated': updated.toString(),
    'location': location,
    'colorId': colorId,
    'startDate': startDate.toString(),
    'endDate': endDate.toString(),
    'isAllDay': isAllDay ? 1 : 0,
  };
}
