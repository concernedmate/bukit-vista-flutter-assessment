import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  const Guest({required this.id, required this.name, required this.origin, required this.picture});

  final int id;
  final String name;
  final String origin;
  final String picture;

  @override
  List<Object> get props => [id, name, origin, picture];
}
