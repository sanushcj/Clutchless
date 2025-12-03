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
