import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UploadersPage extends StatefulWidget {
  UploadersPage({Key key}) : super(key: key);

  @override
  _UploadersPageState createState() => _UploadersPageState();
}

class _UploadersPageState extends State<UploadersPage> {
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
        body: Container(
          child: Column(
            children: [
              Card(  
                child: Container(
                  height: 60,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    child: Text("Abu Sayed",textAlign: TextAlign.start,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                  )),
              ),
               Card(  
                child: Container(
                  height: 60,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    child: Text("Asm Fahim",textAlign: TextAlign.start,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                  )),
              ),
               Card(  
                child: Container(
                  height: 60,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    child: Text("Parvez Abedin",textAlign: TextAlign.start,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                  )),
              ),
               Card(  
                child: Container(
                  height: 60,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    child: Text("Jane Alom",textAlign: TextAlign.start,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                  )),
              ),
               Card(  
                child: Container(
                  height: 60,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16),
                    child: Text("Rimanujjaman",textAlign: TextAlign.start,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                  )),
              ),
         
            ],
          ),
        ),
      ),
    );
  }
}