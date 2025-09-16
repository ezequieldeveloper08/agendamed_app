class OpeningHour {
  String day;
  String start;
  String end;

  OpeningHour({required this.day, required this.end, required this.start});

  factory OpeningHour.fromJson(Map<String, dynamic> json) {
    return OpeningHour(
      day: json['day'],
      end: json['end'],
      start: json['start'],
    );
  }
}
