import 'dart:async';
import 'dart:convert';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';
import 'package:bukit_vista_flutter_assessment/repository/guest/guest_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'guestList_event.dart';
part 'guestList_state.dart';


class GuestListBloc extends Bloc<GuestListEvent, GuestListState> {
  GuestListBloc({required this.repository}) : super(const GuestListState()) {
   on<GuestListFetched>(_onGuestFetched);
   on<GuestListFiltered>(_onFilterApplied);
  }

  final GuestRepository repository;

  Future<void> _onGuestFetched(GuestListFetched event, Emitter<GuestListState> emit) async {
    try {
        emit(
          state.copyWith(
            status: GuestListStatus.loading,
          )
        );
        final guests = await _fetchGuests();
        return emit(
          state.copyWith(
            status: GuestListStatus.success,
            guests: guests,
            guestsVisible: guests
          )
        );
    } catch (_) {
      if (state.guests.isNotEmpty) {
        emit(
          state.copyWith(
            status: GuestListStatus.success,
            guests: state.guests,
            guestsVisible: state.guests
          )
        );
      }else{
        emit(state.copyWith(status: GuestListStatus.failure));
      }
    }
  }

  Future _onFilterApplied(GuestListFiltered event, Emitter<GuestListState> emit) async {
    if (state.status == GuestListStatus.success){
      if (event.filter.isNotEmpty) {
        final guests = state.guests
            .where((user) =>
                user.name.toLowerCase().contains(event.filter.toLowerCase()))
            .toList();
        return emit(
          state.copyWith(
            status: GuestListStatus.success,
            guestsVisible: guests
          )
        );
      }else{
        return emit(
          state.copyWith(
            status: GuestListStatus.success,
            guestsVisible: state.guests
          )
        );
      }
    }
  }

  Future<List<GuestModel>> _fetchGuests() async {
    //TODO 
    await Future.delayed(Duration(seconds: 1));
    final guest = repository.getGuest();
    return guest;
  }

}