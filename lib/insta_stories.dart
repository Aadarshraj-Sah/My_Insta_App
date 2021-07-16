import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {
  static final List a = [
    "https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
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
  static final List n = ["Your Profile", "Aadu", "Swee", "MsHappy", "Tan", "Sid", "messi", "CR7", "SK","Handey"];
  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Stories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      new Row(
        children: <Widget>[
          new Icon(Icons.play_arrow),
          new Text("Watch All", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final stories = Expanded(
    child: new Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,

        itemBuilder: (BuildContext ctx, int index) => new Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Column(
              children: [
            new Container(
              width: 70.0,
              height: 70.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(a[index])),
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 2.5,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
            ),

             Text(n[index]),
            ],
            ),
            index == 0
                ? Positioned(
                top:40,
                right: 10.0,
                child: new CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 10.0,
                  child: new Icon(
                    Icons.add,
                    size: 14.0,
                    color: Colors.white,
                  ),
                ))
                : new Container(),
          ],
        ),
        itemCount: a.length,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}
