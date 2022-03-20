class HolidayModel {
  const HolidayModel({
    required this.month,
    required this.date,
    required this.name,
  });

  final int month;
  final int date;
  final String name;

  factory HolidayModel.fromMap(Map<String, dynamic> map) => HolidayModel(
        month: map['month'],
        date: map['date'],
        name: map['name'],
      );
}
