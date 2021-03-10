import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ImageLoadedPage extends StatefulWidget {
  ImageLoadedPage({Key key}) : super(key: key);

  @override
  _ImageLoadedPageState createState() => _ImageLoadedPageState();
}

class _ImageLoadedPageState extends State<ImageLoadedPage> {
    List<dynamic> imagesUrls = [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var upLoaderName=Get.arguments[0];
    var subjectName=Get.arguments[1];
    print(upLoaderName);
    print(subjectName);
    getFirebaseImageFolder(subjectName,upLoaderName);
  }
 void getFirebaseImageFolder(String subjectName,String uploaderName) {
    Reference storageRef;
    storageRef = FirebaseStorage.instance.ref().child('CSE/').child("$subjectName/").child(uploaderName);
  storageRef.listAll().then((result) {
      result.items.forEach((res) {
        res.getDownloadURL().then((downloadUrl) {
          setState(() {
            print(downloadUrl);
            imagesUrls.add(downloadUrl);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          title: Text("NotePage"),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                   Container(
                     height: Get.height,
                     child: ListView.builder(
                       itemCount: imagesUrls.length,
                       itemBuilder: (context, index) {
                         return Image.network(imagesUrls[index]);
                       },
                     ),
                   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}