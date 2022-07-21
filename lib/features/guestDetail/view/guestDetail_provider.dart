import 'package:bukit_vista_flutter_assessment/features/guestDetail/bloc/guestDetail_bloc.dart';
import 'package:bukit_vista_flutter_assessment/features/guestDetail/view/guestDetail_page.dart';
import 'package:bukit_vista_flutter_assessment/repository/guest/guest_repository.dart';
import 'package:bukit_vista_flutter_assessment/service/guest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestDetailPageProvider extends StatelessWidget {
  const GuestDetailPageProvider(this.guest_id);
  final int guest_id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuestDetailBloc(repository: GuestRepository(guestApi: NetworkGuestApi()), id: guest_id)..add(GuestDetailFetched()),
      child: GuestDetailPage(),
    );
  }
}