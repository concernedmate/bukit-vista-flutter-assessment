part of 'guestDetail_bloc.dart';

abstract class GuestDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GuestDetailFetched extends GuestDetailEvent {}