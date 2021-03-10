import 'package:NoteShare/Screens/ImageLoadPage.dart';
import 'package:NoteShare/Screens/UploadPage.dart';
import 'package:NoteShare/Screens/UploadersPage.dart';
import 'package:get/get.dart';
import '../Screens/signUpPage.dart';
import '../Screens/SplashScreen.dart';
import '../Screens/SignInPage.dart';
import '../Screens/DashBoard.dart';
import '../Screens/SubjectScreen.dart';


class AppRoutes {
  static String INITIAL = "/";
  static String SIGNINPAGE = "SignInPage";
  static String SIGNUPPAGE = "SignUpPage";
  static String DASHBOARD = "Dashboard";
  static String SUBJECTPAGE = "Subjectscreen";
   static String UPLOADPAGE = "UploadPage";
  static String UPLOADERPAGE = "UploadersPage";
   static String IMAGELOADEDPAGE = "ImageLoadedPage";

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: INITIAL, page: () => SplashPage()),
      GetPage(name: SIGNINPAGE, page: () => SignInPage()),
      GetPage(name: SIGNUPPAGE, page: () => SignUpPage()),
      GetPage(name: DASHBOARD, page: () => DashBoard()),
      GetPage(name: SUBJECTPAGE, page: () => SubjectScreen()),
      GetPage(name: UPLOADPAGE, page: () => UploadPage()),
       GetPage(name: UPLOADERPAGE, page: () => UploadersPage()),
         GetPage(name: IMAGELOADEDPAGE, page: () => ImageLoadedPage()),
    
    ];
  }
}
