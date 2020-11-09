import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mlkit/home_page.dart';
import 'package:flutter_mlkit/models/location.dart';

import 'package:http/http.dart' as http;

Future<Location> getLocation() async {
  final response = await http.get('https://ipinfo.io/geo');
  if (response.statusCode == 200) {
    return Location.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha!');
  }
}

void main() => runApp(MyApp(location: getLocation()));
