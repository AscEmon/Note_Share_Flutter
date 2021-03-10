import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String dropdownValue = 'Select Your Subject';
  List<Asset> images = List<Asset>();
  List<File> fileImageArray = [];
  var id = Get.arguments;
  String departMentName = "";
  String uploaderName;
  Asset asset;
  bool isLoading=false;

  Future<void> pickImages() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
        actionBarTitle: "NoteShare",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
    });
    images.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        fileImageArray.add(tempFile);
      }
    });

    return fileImageArray;
  }

//Multiple image upload under uid
  Future handleUploadImage() async {
    setState(() {
      isLoading=true;
    });
    
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var result = await FirebaseFirestore.instance
        .collection("Users")
        .where("uid", isEqualTo: firebaseUser.uid)
        .get();
    result.docs.forEach((res) {
      print("done");
      print(res.data()["name"]);
      uploaderName = res.data()["name"];
    });
    departMentName = id == 0 ? "CSE" : "OtherSubject";
    CollectionReference user =
        FirebaseFirestore.instance.collection("Uploaders");
    user.add({
      "name": uploaderName,
      "department": departMentName,
      "subjectName": dropdownValue
    });
    try {
      for (int i = 0; i < images.length; i++) {
        final Reference storageRef = FirebaseStorage.instance
            .ref()
            .child(departMentName + "/" + dropdownValue);

        final UploadTask task =
            storageRef.child('$uploaderName/$i/').putFile(fileImageArray[i]);
        await task.then((picValue) async {
           
            
          // await picValue.ref.getDownloadURL().then((downloadUrl) {
          //   print("URL : " + downloadUrl);
          //      url=downloadUrl;
          //   imagesUrls.add(downloadUrl);
          // });
        });
      }
       setState(() {
        print("calling");
         images=null;
         dropdownValue='Select Your Subject';
         isLoading=false;
      //fileImageArray.removeAt(i);
      });
     
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Upload",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(10)),
                height: 180,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            if (dropdownValue == "Select Your Subject") {
                              Get.snackbar(
                                  "Subject Select", "Please Select a  Subject",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            } else {
                              pickImages();
                            }
                          },
                          child: Text("Select"),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        RaisedButton(
                          onPressed: handleUploadImage,
                          child: Text("Upload"),
                        )
                      ],
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurple,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          print(dropdownValue);
                        });
                      },
                      items: <String>[
                        'Select Your Subject',
                        'Object Oriented Programming',
                        'Mobile Application Development',
                        'Data Structure',
                        'Algorithm Analysis',
                        'DataBase Maangement System',
                        'Computer Network'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              flex: 2,
              child: isLoading==false? GridView.count(
                crossAxisCount: 3,
                children:images != null? List.generate(images.length, (index) {
                  asset = images[index];
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                }):[Text("")],
              ):Center(child: CircularProgressIndicator(),)
            ),
          ],
        )),
      ),
    );
  }
}
