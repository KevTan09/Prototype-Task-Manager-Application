import 'package:UTS_Project/src/group_screen/Group_List.dart';
import 'package:UTS_Project/src/login_screen/Sign_Up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  void showAlertDialog(BuildContext context, String message) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context, rootNavigator: true).pop();},
    );

    AlertDialog alert = AlertDialog(
      title: Text('Information', style: TextStyle(color: Colors.lightBlue),),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

        if(user != null) {
          Navigator.popAndPushNamed(context, GroupListScreen.id);
        } else {
          showAlertDialog(context, 'Anda belum terdaftar');
        }
      }catch(e){
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Silahkan Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Enter an email!';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Email'
                  ),
                  onSaved: (input) => _email = input,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password must consist 6 characters or more';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: signIn,
                      child: Text('Sign In'),
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                      onPressed: () {Navigator.popAndPushNamed(context, SignUpPage.id);},
                      child: Text('Sign Up'),
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}