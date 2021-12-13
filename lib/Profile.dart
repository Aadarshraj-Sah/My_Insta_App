import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EditProfile.dart';
import 'Login.dart';
import 'Home.dart';
import 'Upload.dart';
import 'insta_list.dart';


String url = '';

List<Widget> images = [
//   Image(
//   height: 100,
//   image: NetworkImage('https://i.pinimg.com/originals/73/44/ba/7344ba6cb9168b994cef0967142eacae.jpg'),
//   fit: BoxFit.fill),
//   Image(
//   height: 100,
//   image: NetworkImage('https://images.unsplash.com/photo-1570591753973-56d194d3bd09?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwdHVtYmxyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
//   fit: BoxFit.fill,
// ),
  Image(
    height: 100,
    image: NetworkImage(('$url')),
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
  ),];
class Profile extends StatefulWidget{
  String username='';
  String fullname = '';
  String Bio= '';
  String email='';
  String Website='';
  Profile({Key? key, required this.fullname, required this.username, required this.Bio, required this.email,required this.Website }):super(key:key);

  @override
  ProfileState createState()=> ProfileState();
}

class ProfileState extends State<Profile> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.lock,
                    color: Colors.black
                ),
                Text(

                  widget.username,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black
                ),
              ]),
        ),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Container(
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
                    SizedBox(width:5),
                    Text(
                      "   54  \n posts",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "    315.1M   \n   followers",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "       5    \n following",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.fullname}\n${widget.Bio}\n${widget.Website}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () async {
                  CollectionReference users = FirebaseFirestore.instance.collection('users');
                  DocumentSnapshot ds= await users.doc (widget.email).get();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(email: ds.get('email'))));
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 145, vertical: 10),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.black54)
                        )
                    )
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children:images+ <Widget>[

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
                ],
              ),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  // email = null;
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 10),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.blue)
                        )
                    )
                ),
              ),
              RaisedButton(

                onPressed: () {
                  void signOutGoogle() async{
                    await _googleSignIn.signOut();
                    print("User Sign Out");
                  }
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Login();}), ModalRoute.withName('/'));
                },
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Google Sign Out',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
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
                  onPressed: () async {
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (widget.email).get();
                    // instalistusername= ds.get('username');
                    Navigator.pushNamed(context, '/Home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () async {
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
                    Navigator.pushNamed(context, '/Fav');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  onPressed: () {

                    // Navigator.pushNamed(context, '/Profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}