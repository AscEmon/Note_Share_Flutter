import 'package:flutter/material.dart';

class DashBoardModel{
 
  static List<Department> dept=[
     Department(
      departMentName: "CSE",
      iconData: Icons.engineering 
      ),
      Department(
      departMentName: "EEE",
      iconData: Icons.electric_scooter_sharp 
     ),
      Department(
      departMentName: "IPE",
      iconData: Icons.airline_seat_individual_suite_rounded 
     ),
      Department(
      departMentName: "BBA",
      iconData: Icons.badge 
     ),
      Department(
      departMentName: "ENGLISH",
      iconData: Icons.backpack_outlined 
      ),
      Department(
      departMentName: "MATH",
      iconData: Icons.mark_chat_read 
     ),
      Department(
      departMentName: "PHYSICS",
      iconData: Icons.work_sharp 
     ),
      Department(
      departMentName: "CHEMISTRY",
      iconData: Icons.fact_check 
     ),
  ];
}

class Department {
   final int id;
   final String departMentName;
   final IconData iconData;

  Department({this.id, this.departMentName,this.iconData});
  
}
