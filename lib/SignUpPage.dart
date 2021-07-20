import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:housy_assignment2/LoginPage.dart';
import 'package:housy_assignment2/models/SignUpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/CustomTextFormField.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String value;

  SignUpModel signUpData = SignUpModel();

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
                              signUpData.name = newValue;
                            }),
                        CustomTextFormField(
                            hint: "Email",
                            onChange: (newValue) {
                              signUpData.email = newValue;
                            }),
                        CustomTextFormField(
                            hint: "Password",
                            obscureText: true,
                            onChange: (newValue) {
                              signUpData.passord = newValue;
                            }),
                        CustomTextFormField(
                            hint: "Phone Number",
                            keyboardType: TextInputType.number,
                            onChange: (newValue) {
                              signUpData.phoneNo = newValue;
                            }),
                        DropdownButton<String>(
                          value: signUpData.profession,
                          hint: Text("Select a profession"),
                          items: <String>[
                            'Student',
                            'Doctor',
                            'Engineer',
                            'Businessman',
                            'Other'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              signUpData.profession = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate() &&
                          signUpData.profession != null) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString("name", signUpData.name);
                        await prefs.setString("password", signUpData.passord);
                        await prefs.setString("email", signUpData.email);
                        await prefs.setString(
                            "profession", signUpData.profession);
                        await prefs.setString("phoneNo", signUpData.phoneNo);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Enter/Select all the values properly")));
                    },
                    child: Text('Submit'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                    child: Text("Go to login page"),
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
