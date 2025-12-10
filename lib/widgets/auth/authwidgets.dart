import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hub/themes/pallets.dart';
import 'package:moto_hub/view/home/home_page.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    this.label = '',
    this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.height,
  });

  final TextEditingController controller;

  final String label;
  final String? hintText;

  /// Completely hides the text. No toggle.
  final bool isPassword;

  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;

  final bool readOnly;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double? height;

  // ------------------------------
  // Default Validation
  // ------------------------------

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color, width: 1.4),
  );

  @override
  Widget build(BuildContext context) {
    final defaultHeight = height ?? MediaQuery.of(context).size.height / 15;

    return SizedBox(
      height: defaultHeight,
      child: TextFormField(
        controller: controller,
        keyboardType:
            keyboardType ??
            (isPassword ? TextInputType.text : TextInputType.text),
        textInputAction: textInputAction ?? TextInputAction.next,
        focusNode: focusNode,
        obscureText: isPassword, // ALWAYS HIDDEN (as requested)
        enabled: enabled,
        readOnly: readOnly,
        maxLength: maxLength,
        autocorrect: false,
        enableSuggestions: !isPassword, // disable suggestions for password
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        decoration: InputDecoration(
          counterText: "",
          labelText: label.isEmpty ? null : label,
          hintText: hintText,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: AppPalette.lightSecondary.withOpacity(0.08),
          enabledBorder: _border(AppPalette.lightSecondary),
          focusedBorder: _border(AppPalette.accentBlue),
          errorBorder: _border(Colors.redAccent),
          focusedErrorBorder: _border(Colors.redAccent),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
        ),
        style: const TextStyle(fontSize: 15),
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
  const SignInButton({
    super.key,
    required this.formGlobalKey,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formGlobalKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      //  log('Username: $usernameController, Password: $passwordController');

        formGlobalKey.currentState!.validate();
        log('Username: $usernameController, Password: $passwordController');

        if (usernameController.text == 'admins' &&
            passwordController.text == 'admin123') {
          log("message");
          // Credentials are correct
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
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
