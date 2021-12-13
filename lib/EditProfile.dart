import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'Home.dart';
import 'Profile.dart';
import 'insta_list.dart';


class EditProfile extends StatefulWidget{
  // String username='';
  // String fullname = '';
  // String Bio= '';
  String email= '';
  // EditProfile({Key? key, required this.fullname, required this.username, required this.Bio}):super(key:key);
EditProfile({Key? key, required this.email}):super(key:key);
  @override
  EditProfileState createState()=> EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  String username='';
  String fullname = '';
  String Bio= '';
  String Website='';
  @override

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController bioTextEditingController = TextEditingController();
  TextEditingController websiteTextEditingController = TextEditingController();
  TextEditingController fullnameTextEditingController = TextEditingController();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool _bioValid = true;
  // bool _profileNameValid = true;
  // bool _websiteValid =true;
  // bool _nameValid =true;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  updateUser() {
    if(!usernameTextEditingController.text.isEmpty) {
      users
          .doc(widget.email)
          .update({'username': usernameTextEditingController.text})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    if(!fullnameTextEditingController.text.isEmpty) {
       users
          .doc(widget.email)
          .update({'fullname': fullnameTextEditingController.text})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    if(!websiteTextEditingController.text.isEmpty) {
       users
          .doc(widget.email)
          .update({'Website': websiteTextEditingController.text})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    if(!bioTextEditingController.text.isEmpty) {
      users
          .doc(widget.email)
          .update({'Bio': bioTextEditingController.text})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }


  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),

        ),
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon( Icons.check,
                  color: Colors.blue),
              onPressed: () async {
                updateUser();

                CollectionReference users = FirebaseFirestore.instance.collection('users');
                DocumentSnapshot ds= await users.doc (widget.email).get();
                instalistusername= ds.get('username');
                b[1]='${instalistusername}';
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Profile(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'), email: widget.email, Website: ds.get('Website')))); },
            ),
          )
        ],
      ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height:20),
          Container(
            padding: EdgeInsets.all(20),

            width: 90.0,
            height: 90.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://i.ibb.co/RhzNgYr/1620213159399.jpg")),
              border: Border.all(
                color: Colors.deepOrange,
                width: 2.5,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          ElevatedButton(
            // Within the `FirstScreen` widget
            onPressed: () {},
            child:Text(
              'Change Profile Photo',

              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 170, vertical: 15),),
              // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: fullnameTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter Your New Name',
              ),
              onChanged: (value) {
                setState(() {
                fullname =value;

                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: usernameTextEditingController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your New Username',
                ),
                onChanged: (value) {
                  setState(() {
                  username = value;
                  });
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: websiteTextEditingController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                  hintText: 'Enter your Website',
                ),
                onChanged: (value) {
                  setState(() {
                  Website= value;
                  });
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: bioTextEditingController,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio',
                hintText: 'Enter Bio',
              ),
              onChanged: (value) {
                setState(() {
                  Bio = value;
                });
              },
            ),
          ),
          SizedBox(height:30),
          ElevatedButton(
            // Within the `FirstScreen` widget
            onPressed: () {},
            child:Text(
            'Switch to Professional Account',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
            ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 170, vertical: 15),),
                // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))
              ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            // Within the `FirstScreen` widget
            onPressed: () {},
            child:Text(
              '  Personal Information Setting  ',

              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 170, vertical: 15),),
              // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))
            ),
          ),
        ],
      ),
    ),
    );
  }
}

