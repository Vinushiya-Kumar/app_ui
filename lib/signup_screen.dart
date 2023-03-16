import 'package:app_ui/colors.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  bgImage,
                  fit: BoxFit.cover,
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
                  bottom: 0,
                  child: Text(
                    appName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: primaryColor,
                    ),
                    labelText: "User Name",
                    labelStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: primaryColor,
                    ),
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
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
                        fontWeight: FontWeight.bold)),
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
                    // Handle login button press
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Login to account',
                    style: TextStyle(
                      fontSize: 16, // set desired font size
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // set button primary color
                    textStyle: TextStyle(color: Colors.white), // set text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 15), // set button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // set button border radius
                    ),
                  ),
                ),
              ),
            ),

            //   padding: const EdgeInsets.only(top: 20),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: SizedBox(
            //       height: height * 0.06,
            //       width: width - 40,
            //       child: TextButton(
            //         style: ButtonStyle(
            //           foregroundColor:
            //               MaterialStateProperty.all<Color>(Colors.white),
            //           backgroundColor:
            //               MaterialStateProperty.all<Color>(primaryColor),
            //           overlayColor: MaterialStateProperty.resolveWith<Color?>(
            //             (Set<MaterialState> states) {
            //               if (states.contains(MaterialState.hovered)) {
            //                 return primaryColor.withOpacity(0.04);
            //               }
            //               if (states.contains(MaterialState.focused) ||
            //                   states.contains(MaterialState.pressed)) {
            //                 return primaryColor.withOpacity(0.12);
            //               }
            //               return null; // Defer to the widget's default.
            //             },
            //           ),
            //         ),
            //         onPressed: () {},
            //         child: const Text('Login to account'),
            //       ),
            //     ),
            //   ),
            // ),
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
                      child: const Text('Create Account')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
