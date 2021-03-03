import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => new _PostPageState();
}

class _PostPageState extends State<PostPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List _filePath = [];
  final picker = ImagePicker();


  Future getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _filePath.add(image.path);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.public,
          color: Colors.black,
        ),
        title: Text(
          '生成朋友圈',
          style: (
            TextStyle(
              color: Colors.black,
              fontSize: 20,
            )
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5,),
          GridView.builder(
            shrinkWrap: true,
              itemCount: _filePath.length == 9? _filePath.length: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
                crossAxisSpacing: 3.0,
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int position) {
                if((_filePath.isEmpty && position == 0) || position == _filePath.length) {
                  return GestureDetector(
                    onTap: getImage,
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                  );
                }
                else {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      child: _filePath.length > position ?
                      Image.file(File(_filePath[position]), fit: BoxFit.cover,):
                      Container(),
                    ),
                  );
                }
              }
          ),
        ],
      ),
    );
  }
}