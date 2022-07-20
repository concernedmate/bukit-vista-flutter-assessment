import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../bloc/guestList_bloc.dart';
import 'guestList_page.dart';

class GuestListPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GuestListBloc(httpClient: http.Client())..add(GuestListFetched()),
      child: GuestListPage(),
    );
  }
}