import 'package:NoteShare/Utilities/NavDrawer.dart';
import 'package:flutter/material.dart';
import '../Model/DashBoardModel.dart';
import 'package:get/get.dart';
import '../Utilities/AppRoutes.dart';

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
        title: Text("Departments",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: DashBoardModel.sub.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Get.toNamed(AppRoutes.SUBJECTPAGE, arguments: index);
                });
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      DashBoardModel.sub[index].iconData,
                      size: 40,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(DashBoardModel.sub[index].subjectName,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
