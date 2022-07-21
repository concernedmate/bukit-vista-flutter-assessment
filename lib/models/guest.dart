import 'dart:convert';
import 'package:equatable/equatable.dart';

List<GuestModel> guestModelFromJson(String str) => List<GuestModel>.from(json.decode(str).map((x) => GuestModel.fromJson(x)));

class GuestModel extends Equatable {
  const GuestModel({required this.id, required this.name, required this.origin, required this.picture});

  final int id;
  final String name;
  final String origin;
  final String picture;

  @override
  List<Object> get props => [id, name, origin, picture];

  factory GuestModel.fromJson(Map<String, dynamic> json) => GuestModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        picture: json["picture"],
    );
}
