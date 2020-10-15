import 'package:UTS_Project/src/group_screen/Assign_Task.dart';
import 'package:UTS_Project/src/group_screen/Group_List.dart';
import 'package:UTS_Project/src/group_screen/Group_Menu.dart';
import 'package:UTS_Project/src/group_screen/Task_Detail.dart';
import 'package:UTS_Project/src/login_screen/Sign_In.dart';
import 'package:UTS_Project/src/login_screen/Sign_Up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Cardo'),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id : (context) => LoginPage(),
          SignUpPage.id : (context) => SignUpPage(),
          GroupListScreen.id: (context) => GroupListScreen(),
          GroupScreen.id: (context) => GroupScreen(),
          AssignTask.id: (context) => AssignTask(),
          TaskDetail.id: (context) => TaskDetail(),
        }
    );
  }
}