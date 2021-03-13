import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utilities/AppRoutes.dart';
import '../main.dart';



class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>with SingleTickerProviderStateMixin {
   AnimationController controller;
 void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2),value: 0.0, upperBound: 1.0)..repeat(reverse: true);
    controller.forward().whenComplete(() => navigationPage());
  }

  void navigationPage() async {
    try {
      bool loginstatus=prefs.getBool("loginStatus");
      loginstatus==true?Get.offAndToNamed(AppRoutes.DASHBOARD):loginstatus==null?Get.offAndToNamed(AppRoutes.SIGNINPAGE):Get.offAndToNamed(AppRoutes.SIGNINPAGE);
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
          child: ScaleTransition(
            scale: CurvedAnimation(parent: controller,curve: Curves.ease),
                   child: Image.asset(
                "images/noteShareSplash.png",
                height: Get.height,
                width: Get.width,
              ),
          ),
        ),
      ),
    );
  }
}
