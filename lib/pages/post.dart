import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => new _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(20),
            height: 300,
            color: Colors.blueAccent,
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.grey,
              size: 50,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(20),
            height: 250,
            color: Colors.redAccent,
            child: Icon(
              Icons.add_circle_outline_rounded,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
