

import 'package:flutter/material.dart';
import 'package:fraud_detector/home_screen.dart';
import 'LoginScreen.dart';
import 'SplashScreen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraud Detector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),

      },
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//         title: 'FlutterBase',
//         home: Scaffold(
//           backgroundColor: Colors.white,
//             appBar: AppBar(
//               title: Text('Fraud Detector'),
//               backgroundColor: Colors.blue,
//
//             ),
//             body: Center(
//
//               child: Column(
//                 children: <Widget>[
//
//                   Image.asset(
//                     "assets/images/bluetick.jpg",
//                     height: 500,
//                     width: 500,
//                   ),
//
//                    LoginButton(), // <-- Built with StreamBuilder
//                   // UserProfile() // <-- Built with StatefulWidget
//                 ],
//               ),
//             )
//         )
//     );
//   }
// }

// class UserProfile extends StatefulWidget {
//   @override
//   UserProfileState createState() => UserProfileState();
// }
//
// class UserProfileState extends State<UserProfile> {
//   Map<String, dynamic> _profile;
//   bool _loading = false;
//
//   @override
//   initState() {
//     super.initState();
//
//     // Subscriptions are created here
//     authService.profile.listen((state) => setState(() => _profile = state));
//
//     authService.loading.listen((state) => setState(() => _loading = state));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
//       Text(_loading.toString())
//     ]);
//   }
// }
//
//
// class LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: authService.user,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return HomeScreen();
//
//           } else {
//             return MaterialButton(
//               onPressed: () => authService.googleSignIn(),
//               color: Colors.white,
//               // textColor: Colors.black,
//               elevation: 5.0,
//               minWidth: 300.0,
//               height: 50,
//               shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Text('LOGIN' ,style: new TextStyle(fontSize: 20, color: Colors.black)),
//             );
//           }
//         });
//   }
// }