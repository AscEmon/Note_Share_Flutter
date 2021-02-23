import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utilities/AppRoutes.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _loginEmail = TextEditingController();
  TextEditingController _loginPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.email_outlined,
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
                  onPressed: () {
                    print("tapped signIn");
                    setState(() {
                       Get.offAndToNamed(AppRoutes.DASHBOARD);
                    });
                   
                  },
                  child: Text("   Sign In   ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
        )),
      ),
    );
  }
}
