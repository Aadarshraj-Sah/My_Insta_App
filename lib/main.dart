import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:first_app/LoginSignup.dart';
import 'Dm.dart';
import 'Fav.dart';
import 'Home.dart';
import 'Login.dart';
import 'Profile.dart';
import 'Search.dart';
import 'Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Upload.dart';

var email;
Future<void> main() async {
  String username='';
  String fullname = '';
  String Bio= '';
  String Website= '';
  String caption='';

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  runApp(
    MaterialApp(
      title: 'InstaUI',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => LoginSignup(),
        '/Login' : (context) => Login(),
        '/Signup' : (context) => Signup(),
        '/Home' : (context) => Home(fullname:fullname,username: username, Bio : Bio, email:email, caption:caption ),
        '/Profile' : (context) => Profile(fullname:fullname, username: username, Bio: Bio,  email:email, Website: Website ),
        '/Search': (context) => Search(),
        '/Dm':  (context) => Dm( username: username),
        '/Fav':  (context) => Fav(),
        '/Upload': (context) => UploadWidget(email: email, username: username,caption:caption),

      },
    ),
  );
}














