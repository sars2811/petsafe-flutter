import 'package:flutter/material.dart';
import 'package:pawsafe/components/component.dart';
import 'package:pawsafe/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pawsafe/screens/feed.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _loginKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool showspinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _loginKey,
      backgroundColor: Colors.green[50],
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'ani',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/ani.jpg'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (val.isEmpty) {
                            return 'Please enter your email';
                          } else if (!regex.hasMatch(val)) {
                            return 'Enter valid email';
                          } else {
                            email = val;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email'),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.length < 6 ? 'Enter correct password' : null,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  )),
              Round(
                  title: 'Log In',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        showspinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, FeedScreen.id);
                        }
                        setState(() {
                          showspinner = false;
                        });
                      } catch (e) {
                        var errorCode = e.code;
                        if (errorCode == 'wrong-password') {
                          _loginKey.currentState.showSnackBar(
                              SnackBar(content: Text('Wrong Password')));
                          setState(() {
                            showspinner = false;
                          });
                        } else if (errorCode == 'user-not-found') {
                          _loginKey.currentState.showSnackBar(
                              SnackBar(content: Text('User not found')));
                          setState(() {
                            showspinner = false;
                          });
                        }
                        print(e);
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
