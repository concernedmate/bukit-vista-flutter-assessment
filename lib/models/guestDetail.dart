import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'booking.dart';

GuestDetailModel guestDetailModelFromJson(String str) => GuestDetailModel.fromJson(json.decode(str));

class GuestDetailModel extends Equatable {
  const GuestDetailModel({
    required this.id, 
    required this.name, 
    required this.origin, 
    required this.picture,
    required this.email,
    required this.phone,
    required this.joindate,
    required this.bookings
  });

  final int id;
  final String name;
  final String origin;
  final String picture;
  final String email;
  final String phone;
  final String joindate;
  final List<BookingModel> bookings;

  @override
  List<Object> get props => [id, name, origin, picture, email, phone, joindate, bookings];

  factory GuestDetailModel.fromJson(Map<String, dynamic> json) => GuestDetailModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        picture: json["picture"],
        email: json["email"],
        phone: json["phone"],
        joindate: json["joindate"],
        bookings: List<BookingModel>.from(json["bookings"].map((x) => BookingModel.fromJson(x)))
    );

  static const empty = GuestDetailModel(id: 0, name: '-', origin: '-', picture: '-', email: '-', phone: '-', joindate: '-', bookings: []);
}
