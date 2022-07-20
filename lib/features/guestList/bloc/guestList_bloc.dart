import 'dart:async';
import 'dart:convert';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'guestList_event.dart';
part 'guestList_state.dart';


class GuestListBloc extends Bloc<GuestListEvent, GuestListState> {
  GuestListBloc({required this.httpClient}) : super(const GuestListState()) {
   on<GuestListFetched>(_onGuestFetched);
  }

  final http.Client httpClient;

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
          )
        );
    } catch (_) {
      if (state.guests.isNotEmpty) {
        emit(
          state.copyWith(
            status: GuestListStatus.success,
            guests: state.guests,
          )
        );
      }else{
        emit(state.copyWith(status: GuestListStatus.failure));
      }
    }
  }

  Future<List<Guest>> _fetchGuests() async {
    await Future.delayed(Duration(seconds: 2));
    return [Guest(id: 1, name: 'name', origin: 'origin', picture: 'picture')];
  }

}