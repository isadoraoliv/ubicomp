import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mlkit/models/location.dart';
import 'package:http/http.dart' as http;

/// PARA TESTAR GET API
/// SÓ CHAMAR ESSA TELA
class LocationPage extends StatefulWidget {
  final Future<Location> location;

  LocationPage({Key key, this.location}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Vote',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Verifica IP'),
        ),
        body: Center(
          child: FutureBuilder<Location>(
            future: widget.location,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.ip + '\n' + snapshot.data.city);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Id :' +
                        snapshot.data.ip +
                        '\n\ntitle : ' +
                        snapshot.data.city,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
