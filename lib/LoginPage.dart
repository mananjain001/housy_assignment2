import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:housy_assignment2/SignUpPage.dart';
import 'package:housy_assignment2/models/LoginModel.dart';
import 'package:housy_assignment2/models/SignUpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'widgets/CustomTextFormField.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginModel loginData = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                            hint: "Name",
                            onChange: (newValue) {
                              loginData.name = newValue;
                            }),
                        CustomTextFormField(
                            hint: "Password",
                            obscureText: true,
                            onChange: (newValue) {
                              loginData.passord = newValue;
                            }),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String namePref = await prefs.getString("name");
                        String passwordPref = await prefs.getString("password");
                        if (namePref == null || passwordPref == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("No user registered.")));
                          return;
                        }
                        if (namePref == loginData.name &&
                            passwordPref == loginData.passord) {
                          //Navigate to next page
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Logged in")));
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Name/Password incorrect")));
                      }
                    },
                    child: Text('Submit'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUpPage())),
                    child: Text("Go to signup page"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
