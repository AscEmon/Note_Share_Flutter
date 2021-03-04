import 'package:NoteShare/Screens/UploadPage.dart';
import 'package:NoteShare/Utilities/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:NoteShare/Model/SubjectModel.dart';
class SubjectScreen extends StatefulWidget {
 

  SubjectScreen({Key key,}) : super(key: key);
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  //var idd=Get.arguments;
   var id=Get.arguments;
   
  @override
  Widget build(BuildContext context) {
  return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:(){
              Get.toNamed(AppRoutes.UPLOADPAGE);
            } ,

          ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Subject",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      
      body: Container(
        child: id==0?ListView.builder(
          itemCount: SubjectModel.sub.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
               Get.toNamed(AppRoutes.UPLOADERPAGE);
              },
              child: Card(
                elevation: 0,
                child: Container(
                  height: 60,
                  child: Center(
                    child: Text(SubjectModel.sub[index].subjectName,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
        ):Center(child:Text("It will be uploaded very soon"),),
      ),
    ));
  }
}