import 'package:flutter/widgets.dart';

class GalleryExampleItem {
  GalleryExampleItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2)),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(
            galleryExampleItem.resource,
            height: 150.0,
            width: 150,
          ),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag1",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag1",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag1",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource:
        "https://images.unsplash.com/photo-1629293360328-fc31e9e735a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9vciUyMGNoaWxkcmVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  ),
];
