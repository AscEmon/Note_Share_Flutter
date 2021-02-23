import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectScreen extends StatefulWidget {
 
 var id;
  SubjectScreen({Key key,this.id}) : super(key: key);
  @override
  _SubjectScreenState createState() => _SubjectScreenState(this.id);
}

class _SubjectScreenState extends State<SubjectScreen> {
  //var idd=Get.arguments;
   var id;
   _SubjectScreenState(this.id);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text(Get.arguments.toString()),
        ),
      ),
    );
  }
}