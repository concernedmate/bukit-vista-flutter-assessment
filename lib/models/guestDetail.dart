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
    required this.phone,
    required this.bookings
  });

  final int id;
  final String name;
  final String origin;
  final String picture;
  final String phone;
  final List<BookingModel> bookings;

  @override
  List<Object> get props => [id, name, origin, picture, phone, bookings];

  factory GuestDetailModel.fromJson(Map<String, dynamic> json) => GuestDetailModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        picture: json["picture"],
        phone: json["phone"],
        bookings: List<BookingModel>.from(json["bookings"].map((x) => BookingModel.fromJson(x)))
    );

  static const empty = GuestDetailModel(id: 0, name: '-', origin: '-', picture: '-', phone: '-', bookings: []);
}
