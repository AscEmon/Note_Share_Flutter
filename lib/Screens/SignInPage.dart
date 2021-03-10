import 'package:NoteShare/Screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utilities/AppRoutes.dart';
 // bool loginStatus=false;
class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _loginEmail = TextEditingController();
  TextEditingController _loginPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  void signIn() async {
    
    if (_formKey.currentState.validate()) {
      // _formKey.currentState.save();
         
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _loginEmail.text, password: _loginPassword.text);
        if (userCredential.user.uid!=null) {
         // loginStatus=true;
         // pref.setBool("loginStatus",loginStatus??false);
          Get.offAndToNamed(AppRoutes.DASHBOARD);
          _loginEmail.clear();
          _loginPassword.clear();
          
        }
      } on FirebaseAuthException catch (e) {
        _loginEmail.clear();
        _loginPassword.clear();
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "No user found for that email.",
              backgroundColor: Colors.greenAccent,
              snackPosition: SnackPosition.BOTTOM);
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Wrong password provided for that user.",
              backgroundColor: Colors.greenAccent,
              snackPosition: SnackPosition.BOTTOM);
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff90000),
        bottomNavigationBar: Container(
          width: Get.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do not have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    print("tap");
                    Get.toNamed(AppRoutes.SIGNUPPAGE);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        "images/noteShareSplash.png",
                        height: 100,
                        width: Get.width,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Notes At Your Phone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: _loginEmail,
                        decoration: new InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.trim().isEmpty)
                            return "Email is Required";
                          else if (!GetUtils.isEmail(value.trim()))
                            return "Please enter valid email";
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: _loginPassword,
                        decoration: new InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(10),
                        onPressed: signIn,
                        child: Text("   Sign In    ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
