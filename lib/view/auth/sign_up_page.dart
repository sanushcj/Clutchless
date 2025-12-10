import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moto_hub/model/signup_model.dart';
import 'package:moto_hub/themes/pallets.dart';
import 'package:moto_hub/view/auth/first_page.dart';
import 'package:moto_hub/widgets/auth/authwidgets.dart';

class SignUpPageOne extends StatefulWidget {
  const SignUpPageOne({super.key});

  @override
  State<SignUpPageOne> createState() => _SignUpPageOneState();
}

class _SignUpPageOneState extends State<SignUpPageOne> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _step = 0; // 0 = name, 1 = email, 2 = password

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _showError(String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    return msg;
  }

  bool _isValidEmail(String email) {
    // very simple email check — replace with stronger validation if needed
    return email.contains('@') && email.contains('.');
  }

  void _onNextPressed() {
    if (_signUpFormGlobalKey.currentState!.validate()) {
      if (kDebugMode) {
        log("validated");
      }
      return;
    }

    switch (_step) {
      case 0:
        if (_nameController.text.trim().isEmpty) {
          _showError('Please enter your name');
          return;
        }
        setState(() => _step = 1);
        break;
      case 1:
        if (_emailController.text.trim().isEmpty) {
          _showError('Please enter your email');
          return;
        }
        if (!_isValidEmail(_emailController.text.trim())) {
          _showError('Please enter a valid email address');
          return;
        }
        setState(() => _step = 2);
        break;
      case 2:
        if (_passwordController.text.isEmpty) {
          _showError('Please enter a password');
          return;
        }
        if (_passwordController.text.length < 6) {
          _showError('Password must be at least 6 characters');
          return;
        }

        _submit();
        break;
    }
  }

  void _onBackPressed() {
    if (_step == 0) {
      Navigator.maybePop(context);
      return;
    }
    setState(() => _step -= 1);
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final pwd = _passwordController.text;

    final signupData = SignupModel(name: name, email: email, password: pwd);

    print(signupData.toJson());

    // dispose();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage(title: "title")),
      (Route<dynamic> route) => false,
    );
  }

  final GlobalKey<FormState> _signUpFormGlobalKey = GlobalKey<FormState>();

  Widget _buildStepContent() {
    switch (_step) {
      case 0:
        return Column(
          key: const ValueKey('name'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'enter your\nname',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppPalette.textDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthTextField(
              errorMessage : 'Please enter your name',
        suffixIconP: false,
              controllername: 'Name',
              labelText: 'name',
              usernameController: _nameController,
            ),
            const SizedBox(height: 20),
          ],
        );
      case 1:
        return Column(
          key: const ValueKey('email'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'enter your\nemail',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppPalette.textDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthTextField(
              errorMessage: 'Please enter your email',
              suffixIconP: false,
              controllername: 'Email',
              labelText: 'email',
              usernameController: _emailController,
            ),
            const SizedBox(height: 20),
          ],
        );
      case 2:
        return Column(
        
          key: const ValueKey('password'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'create\npassword',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppPalette.textDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AuthTextField(
              errorMessage: 'Password must be at least 6 characters',
              suffixIconP: false,
              controllername: 'Password',
              labelText: 'password',
              usernameController: _passwordController,
            ),
            const SizedBox(height: 20),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / 1.3;
    final buttonHeight = MediaQuery.of(context).size.width / 7;

    return Form(
      key: _signUpFormGlobalKey,
      child: Scaffold(
        backgroundColor: AppPalette.lightPrimary,
        appBar: AppBar(
          backgroundColor: AppPalette.lightPrimary,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _onBackPressed,
            color: AppPalette.textDark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // center vertically a little higher so content sits nicely above keyboard
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  final offset = Tween<Offset>(
                    begin: const Offset(0, 0.2),
                    end: Offset.zero,
                  ).animate(animation);
                  return SlideTransition(
                    position: offset,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: _buildStepContent(),
              ),
      
              const SizedBox(height: 10),
      
              // small progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: _step == i ? 28 : 12,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _step == i
                          ? AppPalette.accentBlue
                          : Colors.grey.shade300,
                    ),
                  );
                }),
              ),
      
              const SizedBox(height: 18),
      
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: _onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.accentBlue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    _step < 2 ? 'next' : 'finish',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.textLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
