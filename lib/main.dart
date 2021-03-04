import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Utilities/AppRoutes.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',//'Settings', //'SignInPage', 
      getPages: AppRoutes.AppRoutesList(),
      title: 'Note Share',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.red,
        accentColor: Colors.red,
        backgroundColor: Colors.red,
      ),
    );
  }
}
