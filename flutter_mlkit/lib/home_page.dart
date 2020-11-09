import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mlkit/models/location.dart';
import 'package:flutter_mlkit/pages/face_recognition_page.dart';
import 'package:flutter_mlkit/pages/location_page.dart';
import 'package:flutter_mlkit/pages/text_recognition_page.dart';

class MyApp extends StatefulWidget {
  final Future<Location> location;

  MyApp({Key key, this.location}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Vote',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SmartVote'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Face Recognition"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FaceRecognitionPage()));
                  },
                ),
                RaisedButton(
                  child: Text("Text Recognition"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TextRecognitionPage()));
                  },
                ),
                RaisedButton(
                  child: Text("Verifica IP"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LocationPage(location: widget.location)));
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
