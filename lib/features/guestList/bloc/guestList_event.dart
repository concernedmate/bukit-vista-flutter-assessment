part of 'guestList_bloc.dart';

abstract class GuestListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GuestListFetched extends GuestListEvent {}