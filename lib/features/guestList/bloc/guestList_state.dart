part of 'guestList_bloc.dart';

enum GuestListStatus { initial, success, failure, loading }

class GuestListState extends Equatable {
  const GuestListState({
    this.status = GuestListStatus.initial,
    this.guests = const <Guest>[],
  });

  final GuestListStatus status;
  final List<Guest> guests;

  GuestListState copyWith({
    GuestListStatus? status,
    List<Guest>? guests,
    bool? hasReachedMax,
  }) {
    return GuestListState(
      status: status ?? this.status,
      guests: guests ?? this.guests,
    );
  }

  @override
  String toString() {
    return '''GuestState { status: $status, guests: ${guests.length} }''';
  }

  @override
  List<Object> get props => [status, guests];
}