import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:NoteShare/Utilities/check_connectivity.dart';

class ImageLoadedPage extends StatefulWidget {
  ImageLoadedPage({Key key}) : super(key: key);

  @override
  _ImageLoadedPageState createState() => _ImageLoadedPageState();
}

class _ImageLoadedPageState extends State<ImageLoadedPage> {
  List<dynamic> imagesUrls = [];
  bool internetCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var upLoaderName = Get.arguments[0];
    var subjectName = Get.arguments[1];
    print(upLoaderName);
    print(subjectName);
    getFirebaseImageFolder(subjectName, upLoaderName);
  }

  void getFirebaseImageFolder(String subjectName, String uploaderName) {
    isInternet().then((internet) {
      if (internet == true) {
        Reference storageRef;
        storageRef = FirebaseStorage.instance
            .ref()
            .child('CSE/')
            .child("$subjectName/")
            .child(uploaderName);
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
          title: Text("NotePage"),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                internetCheck == false
                    ? Container(
                        height: Get.height,
                        child: ListView.builder(
                          itemCount: imagesUrls.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              height: 500,
                              width: Get.width,
                              fit: BoxFit.fill,
                              imageUrl: imagesUrls[index],
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              //errorWidget: (context, url, error) => Icon(Icons.error),
                            );
                          },
                        ),
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
            ),
          ),
        ),
      ),
    );
  }
}
