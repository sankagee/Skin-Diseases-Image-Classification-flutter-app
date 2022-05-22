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
        primaryColor: Color(0xffe6020a),
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late bool _loading;
  late File _image;
  late List _outputs;
  final _imagePicker = ImagePicker();

  void initState() {
    super.initState();
    _loading= true;

    loadModel().then((value){
      setState((){
        _loading=false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt"
    );
  }

  pickImage() async{
    var image= await _imagePicker.getImage(source: ImageSource.camera);
    if(image == null)
      return null;
    setState(() {
      _loading=true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  classifyImage(File image) async{
    var output =await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading= false;
      _outputs != output;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text('Skin Diseases Finder'),
      ),
      body: _loading?
      Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            _image == null
                ? Container(

            )
                : Container(
              child: Image.file(_image),
              height: 500,
              width: MediaQuery.of(context).size.width-200,
            ),
            SizedBox(
              height: 20,
            ),
            _outputs != null
                ?  Text(
              "${_outputs[0]["label"]}".replaceAll(RegExp(r'[0-9]'), ''),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  background: Paint()..color = Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
                : Text("Classification Waiting")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        backgroundColor: Color(0xffe6020a),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
