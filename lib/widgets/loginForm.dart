import 'package:flutter/material.dart';
import '../comm/commHelper.dart';
import '../comm/genLoginSignupHeader.dart';
import '../comm/genTextFormField.dart';
import '../DatabaseHandler/DbHelper.dart';
import '../models/UserModel.dart';
import '../widgets/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeForm.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
  static const routeName = '/login';
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper.instance;
  }

  login() async {
    String name = _conUserId.text;
    String passwd = _conPassword.text;

    if (name.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      DbHelper db = DbHelper.instance;
      await db.database;
      await db.getLoginUser(name, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeForm()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_name", UserNotes.name);
    sp.setString("user_surname", UserNotes.surname);
    sp.setString("email", UserNotes.email);
    sp.setString("password", UserNotes.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure log'),
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
                  genLoginSignupHeader('Login'),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: login,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Do not have account? '),
                        TextButton(
                          child: Text(
                            'Signup',
                            selectionColor: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupForm()));
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
