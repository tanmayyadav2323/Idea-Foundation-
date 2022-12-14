import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preco/model/image_folder.dart';
import 'package:preco/ui/photo_view.dart';
import 'package:sizer/sizer.dart';

import 'gallery_exxample_item.dart';

class GalleryNavScreen extends StatefulWidget {
  GalleryNavScreen({Key? key}) : super(key: key);

  @override
  State<GalleryNavScreen> createState() => _GalleryNavScreenState();
}

class _GalleryNavScreenState extends State<GalleryNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('ImageFolder').get(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                List<ImageFolder> folders = snapshot.data!.docs.map((e) {
                  return ImageFolder.fromMap(e.data());
                }).toList();
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                        children: folders
                            .map((e) => buildImageFolder(e) as Widget)
                            .toList(),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  buildImageFolder(ImageFolder imageFolder) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryExample(
              gItems: imageFolder.urls
                  .map((e) => GalleryExampleItem(id: 'id', resource: e))
                  .toList(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: ListTile(
          title: Text(
            imageFolder.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  imageOfLeaningCentreWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: ListTile(
          title: Text(
            "Images of Learning Centre",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

galleryWidget(context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
        title: Text(
          "Umang initiative of women",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

designWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryExample(
                  gItems: <GalleryExampleItem>[
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_1.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_2.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_3.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_4.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_5.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_6.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_7.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_8.png",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/rm_9.png",
                    ),
                  ],
                )),
      );
    },
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
        title: Text(
          "Designs",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
