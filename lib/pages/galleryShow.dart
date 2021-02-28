import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryShowPage extends StatefulWidget {
  int index;
  GalleryShowPage({this.index});

  @override
  _GalleryShowPageState createState() => new _GalleryShowPageState();
}

class _GalleryShowPageState extends State<GalleryShowPage> {
  int currentIndex = 0;
  int initialIndex;
  int title;

  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    title = initialIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollDirection: Axis.horizontal,
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: 50,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage('http://1.15.86.128/resource/img/1/${index+1}.jpg'),
                  initialScale: PhotoViewComputedScale.contained * 1,
                  minScale: PhotoViewComputedScale.contained * 1,
                );
              },
              backgroundDecoration: BoxDecoration(
                color: Colors.black,
              ),
              pageController: PageController(initialPage: initialIndex), //点进去哪页默认就显示哪一页
              onPageChanged: onPageChanged,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Image ${currentIndex + 1}",
                style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(this);
              },
            ),
          ],
        ),
      ),
    );
  }
}
