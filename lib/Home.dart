import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Dm.dart';
import 'Profile.dart';
import 'Upload.dart';
import 'insta_body.dart';
import 'Signup.dart';

var email;
class Home extends StatefulWidget{
  Home({Key? key, required this.fullname, required this.username, required this.Bio, required this.email, required this.caption }):super(key:key);
  String username='';
  String fullname = '';
  String Bio= '';
  String email='';
  String caption='';

  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: new Icon(
              Icons.camera_alt,
              color: Colors.black
          ),
          title: SizedBox(
              height: 120, child: Image.network("https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png")
          ),

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                  Icons.live_tv,
                  color: Colors.black
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon( Icons.send,
                    color: Colors.black),
                onPressed: () async {
                  CollectionReference users = FirebaseFirestore.instance.collection('users');
                  DocumentSnapshot ds= await users.doc (widget.email).get();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dm(username: ds.get('username'))));
                },
              ),
            )
          ],
        ),
        // body: new InstaBody(),
        body: new InstaBody(),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 60.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    email = widget.email;
                    Navigator.pushNamed(context, '/Home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    email = widget.email;
                    Navigator.pushNamed(context, '/Search');

                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () async {
                    email = widget.email;
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (widget.email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadWidget(email:ds.get('email'), username:ds.get('username'), caption:ds.get('caption') )));
                    //Navigator.pushNamed(context, '/upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    email = widget.email;
                    Navigator.pushNamed(context, '/Fav');
                  },
                ),
                // new IconButton(
                //   icon: Icon(
                //     Icons.account_box_outlined,
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/Profile');
                //   },
                // ),
                ClipOval(
                  child:FlatButton(
                    child: new Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage("https://i.ibb.co/RhzNgYr/1620213159399.jpg")),
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),

                    ),
                    onPressed: () async {
                      email = widget.email;
                      url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                      CollectionReference users = FirebaseFirestore.instance.collection('users');
                      DocumentSnapshot ds= await users.doc (widget.email).get();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'), email: widget.email, Website: ds.get('Website'))));
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}