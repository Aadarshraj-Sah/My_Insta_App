import 'package:flutter/material.dart';
import 'package:first_app/insta_list.dart';



class InstaBody extends StatefulWidget {
  const InstaBody({Key? key}) : super(key: key);

  @override
  _InstaBodyState createState() => _InstaBodyState();
}

class _InstaBodyState extends State<InstaBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Expanded(flex: 1, child: new InstaStories()),
        Flexible(child: InstaList())
      ],
    );
  }
}


