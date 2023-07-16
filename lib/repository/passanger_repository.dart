import 'dart:convert';

import 'package:http/http.dart' as http;

class PassangerRepository {
  Future<dynamic> getPassengerData({int currentPage = 1}) async {
    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    return data;
  }
}

class PullToRefreshPassangerRepository {
  Future<dynamic> getPassengerData(int currentPage) async {
    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);
    //final data = jsonDecode(response.body);

    return response;
  }
}
