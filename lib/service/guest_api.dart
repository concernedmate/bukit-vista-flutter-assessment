import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:bukit_vista_flutter_assessment/constants.dart';
import 'package:bukit_vista_flutter_assessment/models/guest.dart';

abstract class GuestApi {
  const GuestApi();

  Future<List<GuestModel>> getGuest();
}

class NetworkGuestApi extends GuestApi {
  final String baseUrl = kBASE_URL;

  @override
  Future<List<GuestModel>> getGuest() async {
    try {
      //final apiUrl = Uri.parse(baseUrl + '/api/guest');
      //final response = await http.get(apiUrl);
      final body = await rootBundle.loadString('lib/assets/guest_sample.json');
      final response = http.Response(
        body,
        200
      );
      
      if (response.statusCode == 200) {
        return guestModelFromJson(response.body);
      } else {
        if (response.statusCode == 500) {
          throw Exception("Internal Server Error");
        } else {
          throw Exception("Failed to fetch available guests");
        }
      }
    } on Exception catch (e) {
      return [];
    }
  }
}