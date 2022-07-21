import 'dart:async';
import 'dart:convert';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';
import 'package:bukit_vista_flutter_assessment/models/guestDetail.dart';
import 'package:bukit_vista_flutter_assessment/repository/guest/guest_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'guestDetail_event.dart';
part 'guestDetail_state.dart';

class GuestDetailBloc extends Bloc<GuestDetailEvent, GuestDetailState> {
  GuestDetailBloc({required this.repository, required this.id}) : super(const GuestDetailState()) {
   on<GuestDetailFetched>(_onGuestDetailFetched);
  }

  final GuestRepository repository;
  final int id;

  Future<void> _onGuestDetailFetched(GuestDetailFetched event, Emitter<GuestDetailState> emit) async {
    try {
      final guestDetail = await _fetchGuestDetail(id);
      
      return emit(
        state.copyWith(
          status: GuestDetailStatus.success,
          guestDetail: guestDetail
        )
      );
    } catch (_) {
      return emit(
        state.copyWith(
          status: GuestDetailStatus.failure,
          guestDetail: state.guestDetail
        )
      );
    }
    
  }

  Future<GuestDetailModel> _fetchGuestDetail(int id) async {
    await Future.delayed(Duration(seconds: 2));
    final guest = repository.getGuestDetail(id);
    return guest;
  }
}