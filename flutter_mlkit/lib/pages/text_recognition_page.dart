import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mlkit/models/location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class TextRecognitionPage extends StatefulWidget {
  @override
  _TextRecognitionPageState createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  final TextRecognizer textRecognizer =
      FirebaseVision.instance.textRecognizer();
  PickedFile pickedImage;
  bool hasLoaded = false;
  String printText = '';

  Location location;

  @override
  void initState() {
    super.initState();
  }

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
          title: Text("Text Recognition"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              hasLoaded
                  ? Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width,
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            pickedImage == null
                                ? Container()
                                : Image.file(File(pickedImage.path)),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Text(printText),
              RaisedButton(
                child: Text("ler texto"),
                onPressed: () async {
                  String label = await readText();
                  setState(() {
                    printText = label.replaceAll(new RegExp(r'[^0-9]'), '');
                  });
                },
              ),
              SizedBox(height: 8),
              RaisedButton(
                child: Text("mais info"),
                onPressed: () {
                  redirect();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.image),
          onPressed: pickImage,
        ),
      ),
    );
  }

  Future readText() async {
    String text;

    try {
      FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFile(File(pickedImage.path));
      VisionText visionText = await textRecognizer.processImage(visionImage);

      text = visionText.text;
    } catch (e) {
      text = 'Sem foto';
    }

    return text;
  }

  Future redirect() async {
    var response =
        await 'http://www.pallate.com.br/ubiqua/consulta.asp?numero=${printText}&cidade=Belo%20Horizonte';

    if (await canLaunch(response)) {
      await launch(response);
    } else {
      throw 'Could not launch $response';
    }
  }

  Future pickImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) throw Exception("Falha na imagem");

    setState(() {
      pickedImage = image;
      hasLoaded = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
