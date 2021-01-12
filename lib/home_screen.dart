

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatelessWidget{
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarDemo(),
    );

  }

}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();

}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  PermissionStatus _status;
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: "Phishing"),
    Tab(text: "Safe"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Create TabController for getting the index of current tab

    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) async {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
              final PermissionStatus permissionStatus = await _getPermission();
              if (permissionStatus == PermissionStatus.granted) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              } else {
                //If permissions have been denied show standard cupertino alert dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text('Permissions error'),
                      content: Text('Please enable contacts access '
                          'permission in system settings'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ));
              }
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Fraud Detector'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),
      ),
    );
  }
  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
}
void handleClick(String value) {
  if(value== 'Logout')
    {authService.signOut();}
  else{
    print('Settings');
  }

}


