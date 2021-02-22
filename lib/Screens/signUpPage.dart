import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _signUpName = TextEditingController();
  TextEditingController _signUpEmail = TextEditingController();
  TextEditingController _signUpPassword = TextEditingController();
  TextEditingController _signUpConfirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff90000),
        body: Container(
            child: Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 40),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                        //     enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10.0),
                        //   borderSide: BorderSide(
                        //     color: Colors.white,
                        //     width: 2.0,
                        //   ),
                        // ),
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
                          } else if (!value.contains(_signUpPassword.text)) {
                            return "Password is not Matched";
                          }
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(10),
                      onPressed: () {},
                      child: Text("   Sign Up    ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
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
        )),
      ),
    );
  }
}
