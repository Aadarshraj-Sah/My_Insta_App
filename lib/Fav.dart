import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Profile.dart';
import 'Upload.dart';

class Fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,

        ),
        body:SingleChildScrollView(
          child: Center(
            child: Image(
              image: AssetImage('Assets/c.png'),
            ),
          ),
        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 80.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () async {
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadWidget(email:ds.get('email'), username:ds.get('username'), caption:ds.get('caption') )));
                    //Navigator.pushNamed(context, '/upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Fav');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box_outlined,
                  ),
                  onPressed: () async {
                    url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile(fullname:ds.get('fullname'),  username: ds.get('username'), Bio: ds.get('Bio'), email: email, Website: ds.get('Website'))));
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}