import 'package:bukit_vista_flutter_assessment/repository/guest/guest_repository.dart';
import 'package:bukit_vista_flutter_assessment/service/guest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../bloc/guestList_bloc.dart';
import 'guestList_page.dart';

class GuestListPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuestListBloc(repository: GuestRepository(guestApi: NetworkGuestApi()))..add(GuestListFetched()),
      child: GuestListPage(),
    );
  }
}