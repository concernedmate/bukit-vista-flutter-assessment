part of 'guestList_bloc.dart';

enum GuestListStatus { initial, success, failure, loading }

class GuestListState extends Equatable {
  const GuestListState({
    this.status = GuestListStatus.initial,
    this.guests = const <GuestModel>[],
    this.guestsVisible = const <GuestModel>[]
  });

  final GuestListStatus status;
  final List<GuestModel> guests;
  final List<GuestModel> guestsVisible;

  GuestListState copyWith({
    GuestListStatus? status,
    List<GuestModel>? guests,
    List<GuestModel>? guestsVisible
  }) {
    return GuestListState(
      status: status ?? this.status,
      guests: guests ?? this.guests,
      guestsVisible: guestsVisible ?? this.guestsVisible
    );
  }

  @override
  String toString() {
    return '''GuestState { status: $status, guests: ${guests.length}}''';
  }

  @override
  List<Object> get props => [status, guests, guestsVisible];
}