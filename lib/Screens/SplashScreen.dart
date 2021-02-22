import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/AppRoutes.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 3000);
    Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    try {
      Get.offAndToNamed(AppRoutes.SIGNINPAGE);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xfff90000),
          child: Image.asset(
            "images/noteShareSplash.png",
            height: Get.height,
            width: Get.width,
          ),
        ),
      ),
    );
  }
}
