import 'package:flutter/material.dart';
import 'package:moto_hub/themes/pallets.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required TextEditingController usernameController,
    required this.controllername,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;
  final String controllername;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      child: TextField(
        autocorrect: false,
        decoration: InputDecoration(

          //labelText: "hi",
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppPalette.accentRed, width: 20),
            borderRadius: BorderRadius.circular(10),
          ),

        ),
        controller: _usernameController,
      ),
    );
  }
}