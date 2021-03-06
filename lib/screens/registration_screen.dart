import 'package:flash_chat/components/autentication_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  // TODO 1: Usando String static para nomear routes
  static String id = '/registrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // TODO 2.2: E aqui
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              style: TextStyle(color: Colors.grey),
              decoration:
                  ktextFieldDecoration.copyWith(hintText: 'Digite seu email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  ktextFieldDecoration.copyWith(hintText: 'Digite sua senha'),
            ),
            SizedBox(
              height: 24.0,
            ),
            AutentButton(
              bgButtonColor: Colors.purple,
              buttonFunction: () {},
              buttonText: 'Criar conta',
            ),
          ],
        ),
      ),
    );
  }
}
