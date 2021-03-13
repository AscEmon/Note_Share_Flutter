import 'dart:io';
import 'package:NoteShare/Utilities/check_connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  String existName;
  Asset asset;
  bool isLoading = false;
  bool internetCheck = false;

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
  Future handleUploadImage() {
    isInternet().then((internet) async {
      if (internet == true) {
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

              final UploadTask task = storageRef
                  .child('$uploaderName/$i/')
                  .putFile(fileImageArray[i]);
              await task.then((picValue) async {
                Fluttertoast.showToast(
                    msg: "UpLoading...",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                // await picValue.ref.getDownloadURL().then((downloadUrl) {
                //   print("URL : " + downloadUrl);
                //      url=downloadUrl;
                //   imagesUrls.add(downloadUrl);
                // });
              });
            }
            setState(() {
              print("calling");
              images = null;
              dropdownValue = 'Select Your Subject';
              isLoading = false;
              //fileImageArray.removeAt(i);
            });
          } catch (e) {
            print(e);
          }
        
        setState(() {
          isLoading = true;
        });
      } else if (internet == false) {
        setState(() {
          internetCheck = true;
        });
      }
    });
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: handleUploadImage,
                child: Container(
                  height: 50,
                  width: 180,
                  child: Center(
                      child: Text(
                    "Upload",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.image),
                onPressed: () {
                  if (dropdownValue == "Select Your Subject") {
                    Get.snackbar("Subject Select", "Please Select a  Subject",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  } else {
                    pickImages();
                  }
                },
              ),
            ],
          ),
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple, fontSize: 16),
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
                'Cyber Security and Law',
                'Advanced Database Management',
                'Machine Learning',
                'Computer Network'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 16,
            ),
            internetCheck == false
                ? Expanded(
                    flex: 2,
                    child: isLoading == false
                        ? GridView.count(
                            crossAxisCount: 3,
                            children: images != null
                                ? List.generate(images.length, (index) {
                                    asset = images[index];
                                    return AssetThumb(
                                      asset: asset,
                                      width: 300,
                                      height: 300,
                                    );
                                  })
                                : [Text("")],
                          )
                        : Text(""),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                            child: Image.asset(
                          "images/NoInternet_ic.png",
                        )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "No Internet",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
          ],
        )),
      ),
    );
  }
}
