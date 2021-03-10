import 'package:NoteShare/Utilities/AppRoutes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadersPage extends StatefulWidget {
  UploadersPage({Key key}) : super(key: key);

  @override
  _UploadersPageState createState() => _UploadersPageState();
}

class _UploadersPageState extends State<UploadersPage> {
  var subjectName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjectName = Get.arguments;
    print(subjectName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Uploader",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Uploaders')
                .where('subjectName', isEqualTo: subjectName)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.data == null)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return ListView.builder(
                    itemCount: streamSnapshot.data.docs.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.IMAGELOADEDPAGE,
                            arguments: [
                              streamSnapshot.data.docs[index]['name'],
                              subjectName
                            ],
                          );
                        },
                        child: Card(
                          child: Container(
                              height: 60,
                              width: Get.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 16),
                                child: Text(
                                  streamSnapshot.data.docs[index]['name'],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      );
                    });
            },
          )),
    );
  }
}
