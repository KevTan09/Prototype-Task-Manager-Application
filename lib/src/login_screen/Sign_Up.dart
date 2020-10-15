import 'package:UTS_Project/src/Widgets/Signup_Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const id = '/registerScreen';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/asset/Blue-Background.jpg'),
                        fit: BoxFit.cover
                    )
                ),
                child: Center(
                    child: Container(
                        height: 400,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.grey, width: 1)
                        ),
                        child: Center(child: SignUpWidget())
                    )
                )
            )
        )
    );
  }
}