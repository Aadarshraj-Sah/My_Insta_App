import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Profile.dart';
import 'Upload.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          title:Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height:40,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),

                  labelText: 'Search',
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                        Icons.document_scanner_outlined,
                        color: Colors.black
                    ),
                  ]),
            ),

          ],
          leading: BackButton(
              color: Colors.black
          ),
        ),
        body:
        new SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                  height: 50, child: Image.asset("Assets/b.png")
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[

                  Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/73/44/ba/7344ba6cb9168b994cef0967142eacae.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://images.unsplash.com/photo-1570591753973-56d194d3bd09?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwdHVtYmxyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/0f/4c/28/0f4c28670d4679a7ca2ab1afec183cd7.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperaccess.com/full/3501969.png'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://i.redd.it/6xbmtcb4k1n21.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpapercave.com/wp/wp4494775.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://thumbs.dreamstime.com/b/blue-sky-pink-orange-clouds-aesthetic-tumblr-background-wallpaper-fairy-lights-172327487.jpg'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/564x/15/c5/69/15c56972ae4fbb6b394a6e6efced477b.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://media.istockphoto.com/photos/human-hand-holding-a-tumblr-lamp-picture-id1172668370?b=1&k=6&m=1172668370&s=170667a&w=0&h=NyH4tm-k6j2P_VbQdfTI8MM66QAgyMmpuAlqz5Olm6o='),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperaccess.com/full/1235903.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('http://images6.fanpop.com/image/photos/40900000/tumblr-wallpapers-ari-and-rachel-E2-99-A5-40971333-1000-1900.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://image.winudf.com/v2/image1/Y29tLnRodW5rYWJsZS5hbmRyb2lkLmNhaW9fY2FybG9zcm95YWxlMS53YWxscGFwZXJfc2NyZWVuXzFfMTU2NzE1NDQzMV8wMjM/screen-1.jpg?fakeurl=1&type=.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperboat.com/wp-content/uploads/2019/07/tumblr-girl-02.jpg'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('https://images.pexels.com/photos/3685271/pexels-photo-3685271.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('http://images5.fanpop.com/image/photos/29000000/Tumblr-photography-3-tumblr-photography-29018579-500-667.jpg'),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ],
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
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
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