import 'package:flutter/material.dart';

class Dm extends StatefulWidget{
  String username='';
  Dm({Key? key, required this.username}):super(key:key);

  @override
  DmState createState()=> DmState();
}

class DmState extends State<Dm> {

  static final List a = [
  "https://i.ibb.co/RhzNgYr/1620213159399.jpg",
    "https://i.ibb.co/B61PR64/1630428084787.jpg",
    "https://i.ibb.co/cJJzZNy/1627030531284.jpg",
    "https://i.ibb.co/KXwwV7w/1611146821633.jpg",
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
