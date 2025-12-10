import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hub/themes/pallets.dart';
import 'package:moto_hub/view/auth/sign_up_page.dart';
import 'package:moto_hub/widgets/auth/authwidgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required String title});

  final GlobalKey<FormState> _signInglobalFormKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   

    bool changedValue = false;
    return Scaffold(
      backgroundColor: AppPalette.lightPrimary,
      body: Form(
        key: _signInglobalFormKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(50),
              height: double.infinity,
              width: double.infinity,

              //  decoration: BoxDecoration(
              //  image: DecorationImage(
              //  image: AssetImage('assets/auth/dominar_bg.jpg'),
              //   fit: BoxFit.cover,
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width / 1.20,
              height: MediaQuery.of(context).size.height / 1.40,
              //  color: AppPalette.primary,
              decoration: BoxDecoration(
                color: AppPalette.lightPrimary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: AppPalette.lightSecondary, width: 5),
              ),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 25,
                    backgroundImage: AssetImage(
                      'assets/core/app_color_icon.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.lightPrimary,
                      fontSize: 20,

                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Please enter your details to SignIn',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.textGrey,
                      fontSize: 15,

                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleSignInWidget(location: 'assets/auth/applelogo.png'),
                      GoogleSignInWidget(
                        location: 'assets/auth/google-color.png',
                      ),
                      GoogleSignInWidget(
                        location: 'assets/auth/LinkedIn_logo_initials.png',
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text(
                    'OR',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.lightPrimary,
                      fontSize: 15,

                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    'Login',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.lightPrimary,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email Address",
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: AppPalette.lightPrimary,
                        fontSize: 15,

                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  AuthTextField(
                    controller:  usernameController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email or Phone number';
                      } 
                      return null;
                    },
                  onChanged: (value) => log(usernameController.text.trim()),),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: AppPalette.lightPrimary,
                        fontSize: 15,

                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  AuthTextField(
                    controller: passwordController,
                    isPassword: true,
                   onChanged: (value) => log(passwordController.text.trim()),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Checkbox(
                              value: changedValue,
                              onChanged: (value) {
                                if (value == true) {
                                  if (kDebugMode) {
                                    print('$value, sss');
                                  }
                                  value = false;
                                } else {
                                  value = true;
                                  if (kDebugMode) {
                                    print(value);
                                  }
                                }
                              },
                              shape: CircleBorder(),
                              activeColor:
                                  Colors.green, // check mark fill color
                              checkColor: Colors.white, // tick color
                            ),
                            Text(
                              "remember me",
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: AppPalette.lightPrimary,
                                fontSize: 15,

                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        child: Text(
                          'Forgot Password ?',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: AppPalette.textGrey,
                            fontSize: 15,

                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  SignInButton(
                    formGlobalKey: _signInglobalFormKey,
                    usernameController: usernameController,
                    passwordController: passwordController,
                  ),

                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont Have an account",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: AppPalette.textGrey,
                          fontSize: 15,

                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPageOne(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign UP",
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: AppPalette.lightTertiary,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
