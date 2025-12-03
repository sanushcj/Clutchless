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

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          //  decoration: BoxDecoration(
            //  image: DecorationImage(
              //  image: AssetImage('assets/auth/dominar_bg.jpg'),
             //   fit: BoxFit.cover,
              
            color: Colors.black,
          ),
          Container(
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
                Text(
                  'Welcome Back',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment. center,

                  children: [
                    Divider(color: AppPalette.lightPrimary),
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
                    Divider(),
                  ],
                ),
                Center(
                  child: Text(
                    'Login',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: AppPalette.lightPrimary,
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                AuthTextField(
                  usernameController: _usernameController,
                  controllername: 'Username',
                ),
                SizedBox(height: 20),

                AuthTextField(
                  usernameController: _passwordController,
                  controllername: 'Password',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
