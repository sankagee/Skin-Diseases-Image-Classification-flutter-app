import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primaryColor: Color(0xffe6020a),
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TfliteModel(),
    );
  }
}

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            (imageSelect)
                ? Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Image.file(_image),
                    height: 400,
                    width: MediaQuery.of(context).size.width - 200,
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 330),
                    child: const Opacity(
                      opacity: 0.9,
                      child: Center(
                        child: Text(
                          "No image selected",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
            SingleChildScrollView(
              child: Column(
                children: (imageSelect)
                    ? _results.map((result) {
                        return Card(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList()
                    : [],
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: pickImage2,
              tooltip: "Pick Image",
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.image),
            ),
            SizedBox(
              width: 15.0,
            ),
            FloatingActionButton(
              onPressed: pickImage,
              tooltip: "Pick Image",
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.camera),
            ),
          ],
        ));
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future pickImage2() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
