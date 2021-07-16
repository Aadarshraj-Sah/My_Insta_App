import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/insta_stories.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  static final List b =["","aadarsh", "misshappy", "swee", "tan", "sid"];
  static final List c =["","Mumbai,India", "Pune,India", "Hyderabad,India", "Delhi,India", "Punjab,India"];
  static final List d =["","https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
    "https://media-exp3.licdn.com/dms/image/C4E03AQHc6vYFW6MJWw/profile-displayphoto-shrink_800_800/0/1612886682134?e=1631750400&v=beta&t=H8-WiVDeEF9MofBbyO_ywS0tFm97bon0mw23IsLK5zo",
    "https://media-exp3.licdn.com/dms/image/C4D03AQHGU4G2-8ABCw/profile-displayphoto-shrink_800_800/0/1623914344169?e=1631750400&v=beta&t=DZ2nXtj2KhosdOt2gSnaFPHuYxY_t_r3gdU57t8F8BI",
    "https://media-exp3.licdn.com/dms/image/C4E03AQFTfnOYxzdQkg/profile-displayphoto-shrink_800_800/0/1611146821633?e=1631750400&v=beta&t=ltnAHify20CDRbMsbOprwLW-oEJ5SKjYAX6NcP1g47c",
    "https://media-exp3.licdn.com/dms/image/C5603AQFnbUNqPCHUyw/profile-displayphoto-shrink_800_800/0/1609847226661?e=1631750400&v=beta&t=iBTQjv2sS9MBEAf9WvQTjxmpNZu38vtr0I0MBeTzO84"];
  static final List e = ["", "https://i.pinimg.com/originals/fd/c9/98/fdc9984f77e922212d62e0cd330b10c6.png",
    "http://images6.fanpop.com/image/photos/40900000/YourName-kimi-no-na-wa-40955557-1400-700.jpg",
    "https://theawesomeone.com/wp-content/uploads/2020/12/kiminonawa-scaled.jpg",
    "https://filmdaze.net/wp-content/uploads/2018/06/vlcsnap-2018-06-13-16h56m12s456.png",
    "https://cdn.theatlantic.com/thumbor/wwN1-QWO5L7VGpSouvrSMBw1y3I=/79x44:1843x1036/1600x900/media/img/mt/2017/04/your_name-1/original.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) => index == 0
          ? new SizedBox(
        child: new InstaStories(),
        height: deviceSize.height * 0.2,
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                d[index])),
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1.5,
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
                  icon: Icon(Icons.more_vert),
                  onPressed: null,
                )
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: new Image.network(
              e[index],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(isPressed
                          ? Icons.favorite
                          : FontAwesomeIcons.heart),
                      color: isPressed ? Colors.red : Colors.black,
                      onPressed: () {
                        if(!isPressed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(seconds: 1),
                                content: const Text('You have liked the post')
                            ),
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(seconds: 1),
                                content: const Text('You have unliked the post')
                            ),
                          );
                        }
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                    ),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(
                      FontAwesomeIcons.comment,
                    ),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(FontAwesomeIcons.paperPlane),
                  ],
                ),
                new Icon(FontAwesomeIcons.bookmark)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Liked by misshappy, swee and 528,331 others\nYOUR NAME....In the dreams U&I were switching places",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                            "Assets/a.jpg")),
                  ),
                ),
                new SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a comment...",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
            Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
