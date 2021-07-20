import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  Function(String) onChange;
  String hint;
  bool obscureText;
  TextInputType keyboardType;

  CustomTextFormField(
      {@required this.onChange,
      @required this.hint,
      this.obscureText = false,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: onChange,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: "Please enter " + hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
