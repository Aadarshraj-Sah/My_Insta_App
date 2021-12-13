import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'insta_list.dart';

var email;
class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email, _password;
  String username='';
  String fullname = '';
  String Bio= '';
  String caption='';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),

        ),
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              SizedBox(
                height:200,
                child: Image(
                    image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Your Name',
                    ),
                    onChanged: (value){
                      setState(() {
                        _email = value.trim();
                      });
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    }
                ),
              ),
              Text(
                '                                                                 Forgot password?',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,

                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {

                  // Navigate to the second screen using a named route.
                  auth.signInWithEmailAndPassword(email: _email!, password: _password!)
                      .then((value) async {

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', _email!);
                    email = _email!;
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (email).get();
                    instalistusername= ds.get('username');
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'),email: ds.get('email'), caption: ds.get('caption')),
                      ),
                    );
                  })
                      .catchError((err){
                    print(err);
                  });
                },
                child: Text('Log in'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 170, vertical: 15),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
              ),
              SizedBox(height: 30),
              SignInButton(
                Buttons.Google,
                onPressed: () async{
                  //TODO: Adding google sign in
                  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                  final credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );
                  await FirebaseAuth.instance.signInWithCredential(credential)
                      .then((value) async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', googleUser.email);
                    email = googleUser.email;
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(fullname:fullname, Bio: Bio, username: username, email: email, caption: caption,),
                      ),
                    );
                  })
                      .catchError((err) {
                    print(err);
                  });

                },
              ),
              Text(
                '-------------------   OR   ------------------',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      "                     Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      // Within the `FirstScreen` widget
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/Signup');
                      },
                      child: Text('Sign Up'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white24),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize:  15))),
                    ),
                  ]
              ),
              SizedBox(height: 50),
              Text(
                '--------------------------------------------',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Instagram by Facebook',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ]

        ),
      ),
    );
  }
}
