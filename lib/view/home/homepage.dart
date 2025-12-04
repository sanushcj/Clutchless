import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hub/themes/pallets.dart';
import 'package:moto_hub/widgets/auth/authwidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    bool changedValue = false;
    return Scaffold(
      body: Stack(
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
            height: MediaQuery.of(context).size.height / 1.55,
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
                  backgroundImage: AssetImage('assets/core/app_color_icon.png'),
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
            
                SizedBox(height:8),

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
                  usernameController: _usernameController,
                  controllername: 'Username',
                  labelText: 'enter your email or phone number',
                ),
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
                  usernameController: _passwordController,
                  controllername: 'Password',
                  labelText: 'your password',
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
                                print('$value, sss');
                                value = false;
                              } else {
                                value = true;
                                print(value);
                              }
                            },
                            shape: CircleBorder(),
                            activeColor: Colors.green, // check mark fill color
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

                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 23,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),

                    color: Colors.white,
                  ),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.darkPrimary,
                      fontSize: 15,

                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                    Text(
                      "Sign UP",
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: AppPalette.lightTertiary,
                        fontSize: 15,

                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
