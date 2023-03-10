import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = "";
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker & Image Cropper"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green.shade700),
                ),
                onPressed: () async {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    File? croppedFile = (await ImageCropper().cropImage(
                      sourcePath: pickedFile.path,
                      aspectRatioPresets: [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9
                      ],
                    )) as File?;
                    if (croppedFile != null) {
                      setState(() {
                        imagePath = croppedFile.path;
                      });
                    }
                  }
                },
                child: Text("Select Image"),
              ),
            ),
            imagePath != ""
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.file(File(imagePath)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
