import 'package:NoteShare/Utilities/check_connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:NoteShare/Utilities/AppRoutes.dart';

import '../main.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static TextEditingController _signUpName = TextEditingController();
  TextEditingController _signUpEmail = TextEditingController();
  TextEditingController _signUpPassword = TextEditingController();
  TextEditingController _signUpConfirmPassword = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//UserSign Up function where Firebase auth are working
  void signUp() async {
    if (_formKey.currentState.validate()) {
      isInternet().then((internet) async {
        if (internet == true) {
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _signUpEmail.text, password: _signUpPassword.text);

            if (userCredential.user.uid != null) {
               prefs.setBool("loginStatus",true);
              Get.offAndToNamed(AppRoutes.DASHBOARD);
              _userSetUp(
                  _signUpName.text.toString(), _signUpEmail.text.toString());
              _signUpName.clear();
              _signUpEmail.clear();
              _signUpPassword.clear();
              _signUpConfirmPassword.clear();
            }
          } on FirebaseAuthException catch (e) {
            _signUpName.clear();
            _signUpEmail.clear();
            _signUpPassword.clear();
            _signUpConfirmPassword.clear();
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
            } else {
              Get.snackbar("Error", "This email address is already been taken",
                  backgroundColor: Colors.greenAccent,
                  snackPosition: SnackPosition.BOTTOM);
              print(e.message);
            }
          }
        } else if (internet == false) {
          Get.snackbar("Internet", "No Internet");
        }
      });
    }
  }

//userData are store in firestore
  Future<void> _userSetUp(String name, String email) async {
    CollectionReference user = FirebaseFirestore.instance.collection("Users");
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid;
    print(name);

    user.add({'name': name, 'email': email, "uid": uid});

    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff90000),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 30,
                    right: 10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset(
                            "images/signup_ic.png",
                            height: 80,
                            width: Get.width,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: _signUpName,
                            decoration: new InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.account_box,
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
                                return "Name is Required";
                              else
                                return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: _signUpEmail,
                            decoration: new InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.email,
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
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            maxLines: 1,
                            controller: _signUpPassword,
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
                          TextFormField(
                              maxLines: 1,
                              controller: _signUpConfirmPassword,
                              decoration: new InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                labelText: 'Confirm Password',
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
                                } else if (!value
                                    .contains(_signUpPassword.text)) {
                                  return "Password is not Matched";
                                }
                              }),
                          SizedBox(
                            height: 25,
                          ),
                          RaisedButton(
                            padding: EdgeInsets.all(10),
                            onPressed: signUp,
                            child: Text("   Sign Up    ",
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
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
