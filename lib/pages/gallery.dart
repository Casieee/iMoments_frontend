import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'galleryShow.dart';
import 'dart:math';

class GalleryPage extends StatefulWidget {
  @override
  GalleryPageState createState() => new GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  int _imageCounter = 0;
  int number = 0;
  var ran = new Random();

  List<Image> _images = List<Image>.generate(
      50, (i) => Image.network(
    'http://1.15.86.128/resource/img/2/${10 * i + 1}.jpg',
    fit: BoxFit.cover,
  ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Gallery',
          style: TextStyle (
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black,
              semanticLabel: 'search',
            ),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
          IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.black,
                size: 30,
                semanticLabel: 'filter',
              ),
            onPressed: () {

            },
          ),
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(4.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (context, index) {
            if(index ~/ 50 != _imageCounter) {
              List<Image> _moreImages = List<Image>.generate(
                50, (i) => Image.network(
                'http://1.15.86.128/resource/img/2/${ran.nextInt(1500) + 10 * i}.jpg',
                fit: BoxFit.cover,
              ),
              );
              _images.addAll(_moreImages);
              _imageCounter++;
            }

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    print(number);
                    return GalleryShowPage(index: number,);
                  },
                ));
              },
              child: _images[index],
            );
          }
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class SearchBar extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        },
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      //todo: add search results
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      //todo: search suggestions
      child: Center(
        child: Text('suggestions'),
      )
    );
  }
}