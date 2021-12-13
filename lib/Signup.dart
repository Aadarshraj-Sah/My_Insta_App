import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/insta_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'firebase.dart';




var email;
class Signup extends StatefulWidget{
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  String? _email;
  String Bio="";
  String fullname="";
  String username="";
  String website="";
  String password="";
  String caption="";

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
      body:SingleChildScrollView(
        child: Column(
            children: <Widget>[

              SizedBox(
                height:200,
                child: Image(
                    image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _fullnameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    hintText: 'Enter your Full Name',
                  ),
                  onChanged: (value) {
                  setState(() {
                  fullname = value.trim();
                  });
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your Username',
                  ),
                  onChanged: (value) {
                    setState(() {
                      username = value.trim();
                    });
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value.trim();
                    });
                  },
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(

                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('email', _email!);
                  email = _email!;

                  try {
                    await Firebase.initializeApp();
                    UserCredential user =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    User? updateUser = FirebaseAuth.instance.currentUser;
                    updateUser!.updateProfile(displayName: _usernameController.text);
                    // userSetup(_fullnameController.text,_usernameController.text);
                    instalistusername=username;
                    FirebaseFirestore.instance.collection('users')
                        .doc(email)
                        .set({
                      'username' : username,
                      'email' : email,
                      'password': password,
                      'fullname' : fullname,
                      'Bio': Bio,
                      'Website': ' ',
                      'caption': caption,
                    })
                      .then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(fullname:fullname, username: username, Bio: Bio, email: email, caption:caption  )));
                    });

                    Navigator.pushNamed(context, '/Home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text('Sign up'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 170, vertical: 15),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
              ),
              SizedBox(height: 50),
              Text(
                '-------------------   OR   ------------------',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
              Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      "                     Have have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      // Within the `FirstScreen` widget
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/Login');
                      },
                      child: Text('Log in'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white24),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
                          textStyle: MaterialStateProperty.all(TextStyle(fontSize:  15))),
                    ),
                  ]
              ),
              SizedBox(height: 45),
              Text(
                '--------------------------------------------',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
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


