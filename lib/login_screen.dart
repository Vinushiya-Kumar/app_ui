// ignore: unnecessary_import
import 'dart:ui';
import 'package:app_ui/colors.dart';
import 'package:app_ui/home_screen.dart';
import 'package:app_ui/model/login_model.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
// ignore: unused_import
import 'package:app_ui/api/api_service.dart';

// ignore: unused_import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
// ignore: non_constant_identifier_names, unused_field
  late String Mobile, _password;
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel(mobile: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      right: 5,
                      child: Image.asset(
                        bgImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: height * 0.48,
                      width: width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.8],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white,
                              ])),
                      //color: Colors.grey.withOpacity(0.3),
                    ),
                    const Positioned(
                      left: 140,
                      right: 0,
                      bottom: 10,
                      child: Text(
                        appName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor.withOpacity(0.3),
                          primaryColor.withOpacity(0.1),
                        ],
                      ),
                      border: const Border(
                        left: BorderSide(color: primaryColor, width: 5),
                      ),
                    ),
                    child: const Text(
                      "  $loginString",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  child: TextFormField(
                    onSaved: (input) => requestModel.mobile = input!,
                    validator: (value) {
                      Mobile = value!;
                      final RegExp mobileRegex = RegExp(
                          r"^[0-9]{10}$"); // assumes 10 digit phone numbers
                      // ignore: unnecessary_null_comparison
                      if (value == null || value.isEmpty) {
                        return "Please enter a Mobile number";
                      } else if (!mobileRegex.hasMatch(value)) {
                        return "Please enter a valid Mobile number";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: primaryColor,
                      ),
                      labelText: "Mobile number",
                      labelStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  // ignore: sort_child_properties_last
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                      // ignore: unused_label
                      onSaved:
                      (input) => requestModel.password = input;
                      // ignore: unused_label
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length == 6) {
                        return null; // password is correct
                      } else {
                        // print message if password is incorrect
                        return 'Incorrect password';
                        // ignore: dead_code
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: primaryColor,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return primaryColor.withOpacity(0.04);
                            }
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return primaryColor.withOpacity(0.12);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Forget Password?')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          if (validateAndSave()) {}
                          if (Mobile == "0768732873" && _password == "123456") {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homeScreen(),
                              ),
                            );
                          } else {}
                        } else {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('All fields are required')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 140,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Login to account',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(primaryColor),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return primaryColor.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return primaryColor.withOpacity(0.12);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Create Account')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    // ignore: prefer_typing_uninitialized_variables
    var formKey;
    if (formKey.currentState!.validate()) {}
    {
      // ignore: prefer_typing_uninitialized_variables
      var data;
      // ignore: unused_local_variable
      if (data?.isEmpty ?? true) var save = formKey.currentState.save();
      return true;
    }
    // ignore: dead_code
    return false;
  }
}
