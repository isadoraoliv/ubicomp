import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_mlkit/models/location.dart';

class LocationRepository {
  Future<Location> getLocation() async {
    final response = await http.get('https://ipinfo.io/geo');
    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha!');
    }
  }

/*   Future postLocation(Location location) async {
    Location location = await http.post("/", data: {});
  } */
  /*  Future postLocation() {
    return http.post(
      'url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
      }),
    );
  } */
}
