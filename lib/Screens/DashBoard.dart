import 'package:NoteShare/Utilities/NavDrawer.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Departments",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
            centerTitle: true,       
          ),
          drawer: NavDrawer(),
          
      body: Container(
        child: Text("Ok"),
      ),
    ));
  }
}
