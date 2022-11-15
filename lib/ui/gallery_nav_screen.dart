import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preco/ui/photo_view.dart';

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
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Gallery",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              imageOfLeaningCentreWidget(),
              SizedBox(
                height: 16,
              ),
              galleryWidget(context),
              SizedBox(
                height: 16,
              ),
              designWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  imageOfLeaningCentreWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GalleryExample(
                    gItems: <GalleryExampleItem>[
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img1.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img2.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img3.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img4.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img5.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img6.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img7.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img8.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img9.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img10.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img11.jpg",
                      ),
                      GalleryExampleItem(
                        id: "tag1",
                        resource: "assets/images/lc_img12.jpg",
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
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryExample(
                  gItems: <GalleryExampleItem>[
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image1.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image2.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image3.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image4.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image5.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image6.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image7.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image8.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image9.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image10.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image11.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image12.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image13.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image14.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image15.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image16.jpg",
                    ),
                    GalleryExampleItem(
                      id: "tag1",
                      resource: "assets/images/store_image17.jpg",
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
