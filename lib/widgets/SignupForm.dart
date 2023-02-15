// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Comm/commHelper.dart';

import '../DatabaseHandler/DbHelper.dart';
import '../comm/genTextFormField.dart';
import '../models/UserModel.dart';
import 'loginForm.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final _conUsersurname = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
  }

  signUp() async {
    //look signup function?
    String name = _conUserName.text;
    String surname = _conUsersurname.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        //alertDialog(context, 'Password Mismatch');
      } else {
        _formKey.currentState?.save();
        DbHelper db = DbHelper.instance;
        await db.database;
        UserModel uModel = UserModel(
            name: name, surname: surname, email: email, password: passwd);
        db.saveData(uModel).then(
          (value) {
            if (value == -1) {
              alertDialog(context, "User already Exists");
            } else {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginForm()));
            }
          },
        );

        // alertDialog(context, "Error: Data Save Fail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Log'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // genLoginSignupHeader('Secure Log'),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person,
                      hintName: 'Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUsersurname,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'Surname'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextButton(
                      onPressed: signUp,
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Does you have account? '),
                        TextButton(
                          child: const Text(
                            'Sign In',
                            selectionColor: Colors.blue,
                          ),
                          onPressed: () {
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(builder: (_) => LoginForm()),
                            //     (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
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
