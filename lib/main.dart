import 'package:flutter/material.dart';
import 'package:first_app/insta_body.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginSignup(),
        // When navigating to the "/second" route, build the SecondScreen widget.

        '/Login' : (context) => Login(),
        '/Signup' : (context) => Signup(),
        '/Home' : (context) => Home(),
        '/Profile' : (context) => Profile(),
        '/Search': (context) => Search(),
        '/Dm':  (context) => Dm(),
        '/Fav':  (context) => Fav(),
      },
    ),
  );
}

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 200),
            Image(
                image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
            ),
            SizedBox(height: 70),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/Login');
              },
              child: Text('Log in'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 15),),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/Signup');
              },
              child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                  ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 145, vertical: 15),),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.blue)
                      )
                    )
              ),
            ),
          ]

        ),
      ),
    );
  }
}


class Login extends StatelessWidget {
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
                  Navigator.pushNamed(context, '/Home');
                },
                child: Text('Log in'),
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

class Signup extends StatelessWidget {
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  hintText: 'Enter your Full Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/Home');
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
class Home extends StatelessWidget {
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
              onPressed: () {
                Navigator.pushNamed(context, '/Dm');
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
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
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
                          image: new NetworkImage("https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg")),
                      border: Border.all(
                        color: Colors.deepOrange,
                        width: 1,
                      ),
                    ),

                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Profile');
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
class Profile extends StatelessWidget {
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
                  "aadarsh",
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
                          image: new NetworkImage("https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg")),
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
                    "Aaadarshraj Sah\nThe only things which inspire you in life are LOVE\nand FEAR.\nIIT-G'24 CSE",
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
              onPressed: () {
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
              ],
            ),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
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
                  onPressed: (){
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () {},
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
                    Navigator.pushNamed(context, '/Profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

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
                  onPressed: () {},
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

class Dm extends StatelessWidget {
  static final List a = [
    "https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
    "https://media-exp3.licdn.com/dms/image/C4E03AQHc6vYFW6MJWw/profile-displayphoto-shrink_800_800/0/1612886682134?e=1631750400&v=beta&t=H8-WiVDeEF9MofBbyO_ywS0tFm97bon0mw23IsLK5zo",
    "https://media-exp3.licdn.com/dms/image/C4D03AQHGU4G2-8ABCw/profile-displayphoto-shrink_800_800/0/1623914344169?e=1631750400&v=beta&t=DZ2nXtj2KhosdOt2gSnaFPHuYxY_t_r3gdU57t8F8BI",
    "https://media-exp3.licdn.com/dms/image/C4E03AQFTfnOYxzdQkg/profile-displayphoto-shrink_800_800/0/1611146821633?e=1631750400&v=beta&t=ltnAHify20CDRbMsbOprwLW-oEJ5SKjYAX6NcP1g47c",
    "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/ic7defqune831dh9orwm/memoji-2?fimg-client-default"
    "https://i.pinimg.com/564x/40/c7/b5/40c7b514a7684a1ee7c4be6dada100c4.jpg",
    "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    "https://static.india.com/wp-content/uploads/2021/07/pjimage-2021-07-11T211618.289.jpg",
    "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
    "https://i.pinimg.com/originals/56/6a/12/566a12e631c854dd017210ee7acf87b6.jpg",
    "https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-preview.jpg",
  ];
  static final List b =["aadarsh", "misshappy", "swee", "tan", "sid", "Aadu", "Swee", "MsHappy","messi", "CR7", "SK","Handey","jon","Ash","ijso"];
  static final List c =[
    "Have a nice day, bro!..\n.now",
    "Have a nice day, M L!..\n.now",
    "I heard this is a good movie,s.\n.now",
    "See you on the next meeting!\n.15m",
    "Sounds good 😂😂😂.\n.20m",
    "The new design looks cool, b.\n.30m",
    "Thank you, bro!.........\n.40m",
    "Yeap, I'm going to travel in To….\n.50m",
    "Instagram UI is pretty good....\n.1h ",
    "Do you read this message?....\n.2h ",
    "Hii...How r are you?.....\n.3h ",
    "Hey, How you doing?...\n.4h ",
    "Let’s meet someday soon…..\n.5h ",
    "When is your campus reopening.\n.6h ",
    "I miss you my friend…..\n.7h ",
  ];
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

                Text(
                  "aadarsh",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black
                ),
              ]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                        Icons.add,
                        color: Colors.black
                    ),
                  ]),
            ),

          ],
        ),
        body:new SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: a.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 8.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new Container(
                                height: 70.0,
                                width: 70.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          a[index])),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  new Text(
                                    b[index],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    c[index],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          new IconButton(
                            icon: Icon(Icons.camera_alt_outlined),
                            onPressed: null,
                          )
                        ],
                      ),
                    );
                  }
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.lightBlueAccent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                new Text(
                  'Camera',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
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
                  onPressed: () {},
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}


