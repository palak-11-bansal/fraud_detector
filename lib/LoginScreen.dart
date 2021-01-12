import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget{
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();

          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              body: InkWell(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(padding: const EdgeInsets.only(top: 150.0),),

                                    Image.asset(
                                      'assets/images/flutter.png',
                                      height: 200,
                                      width: 200,
                                    ),
                                      Padding(padding: const EdgeInsets.only(top: 60.0),),


                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),


                                      child: TextFormField(
                                         cursorColor: Colors.black,
                                         decoration: InputDecoration(
                                           icon: Icon( Icons.person_outline_outlined,),
                                           hintText: 'Enter your Username',
                                           border: InputBorder.none,
                                         ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),

                                      child: TextFormField(
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          icon: Icon( Icons.mail_outlined,),
                                          hintText: 'Enter your Email',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),

                                      child: TextFormField(
                                        obscureText: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          icon: Icon( Icons.lock,),
                                          hintText: 'Enter your Password',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),

                                    Padding(padding: const EdgeInsets.only(top: 40.0),),
                                    MaterialButton(
                                      onPressed: () => null,
                                      color: Colors.white,
                                      elevation: 5.0,
                                      minWidth: 300.0,
                                      height: 50,
                                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                      child: Text('LOGIN' ,style: new TextStyle(fontSize: 20, color: Colors.black)),
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 20.0),),
                                    Text('OR',style: new TextStyle(fontSize: 20, color: Colors.black)),
                                    Padding(padding: const EdgeInsets.only(top: 20.0),),
                                    MaterialButton(
                                      onPressed: () {  authService.googleSignIn();

                                      },
                                      color: Colors.white,
                                      elevation: 5.0,
                                      minWidth: 300.0,
                                      height: 50,
                                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                      child: Text('LOGIN WITH GOOGLE' ,style: new TextStyle(fontSize: 20, color: Colors.black)),
                                    ),
                                  ],
                                )),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

            );
 
          }
        });
  }

}