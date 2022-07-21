part of 'guestList_bloc.dart';

abstract class GuestListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GuestListFetched extends GuestListEvent {}

class GuestListFiltered extends GuestListEvent {
  GuestListFiltered(this.filter);
  
  final String filter;

  @override
  List<Object> get props => [filter];
}