import 'package:flutter/material.dart';

class DashBoardModel{
 
  static List<Subject> sub=[
     Subject(
      subjectName: "CSE",
      iconData: Icons.backpack_outlined 
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
      subjectName: "CSE",
      iconData: Icons.backpack_outlined 
      ),
      Subject(
      subjectName: "EEE",
      iconData: Icons.backpack_outlined 
     ),
      Subject(
      subjectName: "IPE",
      iconData: Icons.backpack_outlined 
     ),
      Subject(
      subjectName: "BBA",
      iconData: Icons.backpack_outlined 
     ),
  ];
}

class Subject {
   final int id;
   final String subjectName;
   final IconData iconData;

  Subject({this.id, this.subjectName,this.iconData});
  
}
