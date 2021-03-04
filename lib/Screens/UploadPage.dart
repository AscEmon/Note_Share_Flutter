import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UploadPage extends StatefulWidget {
  UploadPage({Key key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String dropdownValue = 'Select Your Subject';
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
                     borderRadius: BorderRadius.circular(10)
                   ),
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
                             onPressed: (){

                             },
                             child: Text("Select"),
                           ),
                           SizedBox(
                             width: 32,
                           ),
                           RaisedButton(
                             onPressed: (){

                             },
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
        });
      },
      items: <String>['Select Your Subject', 'Object Oriented Programming', 'Mobile Application Development', 'Data Structure','Algorithm Analysis','DataBase Maangement System','Computer Network']
          .map<DropdownMenuItem<String>>((String value) {
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


            ],
          )
        ),
      ),
    );
  }
}
