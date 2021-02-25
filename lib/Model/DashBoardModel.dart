import 'package:flutter/material.dart';

class DashBoardModel{
 
  static List<Subject> sub=[
     Subject(
      subjectName: "CSE",
      iconData: Icons.engineering 
      ),
      Subject(
      subjectName: "EEE",
      iconData: Icons.electric_scooter_sharp 
     ),
      Subject(
      subjectName: "IPE",
      iconData: Icons.airline_seat_individual_suite_rounded 
     ),
      Subject(
      subjectName: "BBA",
      iconData: Icons.badge 
     ),
      Subject(
      subjectName: "ENGLISH",
      iconData: Icons.backpack_outlined 
      ),
      Subject(
      subjectName: "MATH",
      iconData: Icons.mark_chat_read 
     ),
      Subject(
      subjectName: "PHYSICS",
      iconData: Icons.work_sharp 
     ),
      Subject(
      subjectName: "CHEMISTRY",
      iconData: Icons.fact_check 
     ),
  ];
}

class Subject {
   final int id;
   final String subjectName;
   final IconData iconData;

  Subject({this.id, this.subjectName,this.iconData});
  
}
