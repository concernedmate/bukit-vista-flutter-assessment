import 'package:bukit_vista_flutter_assessment/features/guestDetail/bloc/guestDetail_bloc.dart';
import 'package:bukit_vista_flutter_assessment/models/guestDetail.dart';
import 'package:bukit_vista_flutter_assessment/service/guest_api.dart';
import 'package:http/http.dart' as http;
import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';

class GuestRepository {
  const GuestRepository({
    required GuestApi guestApi,
  }) : _guestApi = guestApi;

  final GuestApi _guestApi;

  Future<List<GuestModel>> getGuest() => _guestApi.getGuest();
  Future<GuestDetailModel> getGuestDetail(int id) => _guestApi.getGuestDetail(id);
}