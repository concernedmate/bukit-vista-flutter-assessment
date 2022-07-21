import 'dart:convert';
import 'package:equatable/equatable.dart';

List<BookingModel> guestModelFromJson(String str) => List<BookingModel>.from(json.decode(str).map((x) => BookingModel.fromJson(x)));

class BookingModel extends Equatable {
  const BookingModel({
    required this.id, 
    required this.code, 
    required this.location, 
    required this.start,
    required this.end,
    required this.status
  });

  final int id;
  final String code;
  final String location;
  final String start;
  final String end;
  final int status;

  @override
  List<Object> get props => [id, code, location, start, end, status];

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        code: json["code"],
        location: json["location"],
        start: json["start"],
        end: json["end"],
        status: json["status"]
    );
}
