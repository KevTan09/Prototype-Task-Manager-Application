import 'package:UTS_Project/src/Commons/DummyDatas.dart';
import 'package:UTS_Project/src/Widgets/Group_Container.dart';
import 'package:UTS_Project/src/group_screen/Group_Menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupListScreen extends StatefulWidget{
  static const id = '/groupScreenList';

  @override
  State<StatefulWidget> createState() {
    return _GroupListScreenState();
  }
}

class _GroupListScreenState extends State<GroupListScreen>{
  List<Map<String, Object>> groups = Dummy.groupList;
  final firebase = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              FlatButton(
                onPressed: () {
                  firebase.signOut();
                  Navigator.pushReplacementNamed(context, '/loginScreen');
                },
                textColor: Colors.white,
                child: Row(
                  children: [
                    Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(width: 10),
                    Icon(Icons.power_settings_new, color: Colors.white,)
                  ],
                ),
              )
            ],
          ),
          body: ListView(
            children: <Widget>[
              for (var group in groups)
                GroupContainer(
                  group: group,
                  onTap: () {
                    Navigator.pushNamed(context, GroupScreen.id, arguments: {'groupName': group['groupName']});
                  },
                )
            ],
          ),
        ),
      )
    );
  }

}