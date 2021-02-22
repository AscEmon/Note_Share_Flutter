import 'package:get/get.dart';
import '../Screens/signUpPage.dart';
import '../Screens/SplashScreen.dart';
import '../Screens/SignInPage.dart';


class AppRoutes {
  static String INITIAL = "/";
  static String SIGNINPAGE = "SignInPage";
  static String SIGNUPPAGE = "SignUpPage";
  

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: INITIAL, page: () => SplashPage()),
      GetPage(name: SIGNINPAGE, page: () => SignInPage()),
      GetPage(name: SIGNUPPAGE, page: () => SignUpPage()),
    
    ];
  }
}
