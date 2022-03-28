import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../constants.dart';
import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(height: 48.0),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kAuthInputDecoration.copyWith(
                  hintText: 'Enter your email.',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kAuthInputDecoration.copyWith(
                  hintText: 'Enter your Password.',
                ),
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                buttonText: 'Login',
                onPressed: () async {
                  //Go to login screen.
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (user != null) {
                      Navigator.pushNamed(context, '/chat');
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                color: Colors.lightBlueAccent,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
