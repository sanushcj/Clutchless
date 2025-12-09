import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hub/themes/pallets.dart';

class AuthTextField extends StatelessWidget {
   AuthTextField({
    super.key, required this.suffixIconP,
    required TextEditingController usernameController,
    required this.controllername,
    required this.labelText,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;
  final String controllername;
  final String labelText;
   bool suffixIconP ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: MediaQuery.of(context).size.width / 1.2,
      child: TextFormField(
        autocorrect: false,
        validator: (value) {
          if (value==null ) {
            return  'Please enter your email';
          } else {
            return suffixIconP ?  'Please enter your Password' : 'Please enter your Email';
          }
        },
        decoration: InputDecoration(
          suffixIcon: suffixIconP ?   Icon(CupertinoIcons.eye_solid) : null,
         // suffix: Icons.safety_check ,
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppPalette.lightSecondary, width: 20),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: _usernameController,
      ),
    );
  }
}

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(location),
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          scale: 40,
        ),
        color: AppPalette.lightTertiary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppPalette.textDark, width: 2),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.formGlobalKey});

final GlobalKey<FormState> formGlobalKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formGlobalKey.currentState!.validate()) {
          print("Validate akkyyy");
        }
      },
      child: Container(
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
    );
  }
}




