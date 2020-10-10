import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Camera App"),
      ),
      body: Center(
        // if (_image == null){
        //   Text("No Image")
        // }
        // else{
        //   Image.file(_image)
        // }
        child: _image == null ? Text("No Image") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: "Open Camera",
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text(
                      "Take a picture",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      "Select Image from gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  //Future is dart way of handling things which are going to happen in the future and it's going to give you the response back maybe in the future.
  //Since we are using future so we need to happen it async - Asyncronously
  Future openCamera() async {
    //created a variable image which is a wating for image picker to launch a method pick image and need to mention where you want to pick image.
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      //As _image is not a normal variable bcuz it is storing a file and thus we have use that dart.io
      _image = image;
    });
  }

  Future openGallery() async {
    //created a variable image which is a wating for image picker to launch a method pick image and need to mention where you want to pick image.
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      //As _image is not a normal variable bcuz it is storing a file and thus we have use that dart.io
      _image = picture;
    });
  }
}
