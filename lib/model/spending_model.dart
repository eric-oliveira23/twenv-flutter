// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpendingModel {
  final String description;
  final String date;
  final double value;

  SpendingModel({
    required this.description,
    required this.date,
    required this.value,
  });

  SpendingModel copyWith({
    String? description,
    String? date,
    double? value,
  }) {
    return SpendingModel(
      description: description ?? this.description,
      date: date ?? this.date,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'date': date,
      'value': value,
    };
  }

  factory SpendingModel.fromMap(Map<String, dynamic> map) {
    return SpendingModel(
      description: map['description'] as String,
      date: map['date'] as String,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpendingModel.fromJson(String source) =>
      SpendingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpendingModel(description: $description, date: $date, value: $value)';

  @override
  bool operator ==(covariant SpendingModel other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.date == date &&
        other.value == value;
  }

  @override
  int get hashCode => description.hashCode ^ date.hashCode ^ value.hashCode;
}
