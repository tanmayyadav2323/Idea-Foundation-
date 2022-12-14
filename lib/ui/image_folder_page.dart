import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../repositories/storage/storage_repository.dart';

class ImageFolderPage extends StatefulWidget {
  const ImageFolderPage({
    Key? key,
    required this.docId,
  }) : super(key: key);
  final String docId;

  @override
  State<ImageFolderPage> createState() => _ImageFolderPageState();
}

class _ImageFolderPageState extends State<ImageFolderPage> {
  final ImagePicker imagePicker = ImagePicker();
  bool uploadingImage = false;
  List<XFile> selectedImages = [];
  List<dynamic> urls = [];
  List<dynamic> deleteUrls = [];
  bool deleting = false;
  List<Widget> gl = [];

  Future<void> removingImages() async {
    for (var element in deleteUrls) {
      await context.read<StorageRepository>().deleteImage(element);
    }
  }

  Future<void> downloadingImages() async {
    for (var element in selectedImages) {
      String url = await context
          .read<StorageRepository>()
          .uploadPostImage(image: File(element.path), docId: widget.docId);
      urls.add(url);
    }
  }

  void deleteImages() async {
    if (deleteUrls.isNotEmpty) {
      deleting = true;
      setState(() {});
      removingImages().then((value) async {
        urls.removeWhere((element) => deleteUrls.contains(element));
        await FirebaseFirestore.instance
            .collection("ImageFolder")
            .doc(widget.docId)
            .update({'urls': urls}).then((value) {
          deleteUrls = [];
          deleting = false;
          setState(() {});
        });
      });
    }
  }

  void selectImages(BuildContext context) async {
    selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      uploadingImage = true;
      setState(() {});
      downloadingImages().then((value) async {
        await FirebaseFirestore.instance
            .collection("ImageFolder")
            .doc(widget.docId)
            .update({'urls': urls});
        uploadingImage = false;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("ImageFolder")
              .doc(widget.docId)
              .get(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              urls = snapshot.data?.data()!['urls'];
              return Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Images",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          const Spacer(),
                          uploadingImage
                              ? Column(
                                  children: [
                                    Text(deleting
                                        ? 'Deleting...'
                                        : 'Uploading...'),
                                    SizedBox(
                                      child: LinearProgressIndicator(),
                                      width: 20.w,
                                    ),
                                  ],
                                )
                              : (deleteUrls.isNotEmpty || deleting)
                                  ? IconButton(
                                      onPressed: () {
                                        deleteImages();
                                      },
                                      icon: const Icon(Icons.delete),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        selectImages(context);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                        ],
                      ),
                      buildGrid()
                    ],
                  ),
                ),
              );
            }
            return Center(child: Text('Loading...'));
          },
        ),
      ),
    );
  }

  buildGrid() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          children: urls
              .map((url) => BuildCard(
                    url: url,
                    fun: (select) {
                      if (select) {
                        deleteUrls.add(url.toString());
                      } else {
                        deleteUrls.remove(url.toString());
                      }
                      setState(() {});
                    },
                  ))
              .toList(),
        ));
  }
}

class BuildCard extends StatefulWidget {
  final String url;
  final Function(bool) fun;
  const BuildCard({
    Key? key,
    required this.url,
    required this.fun,
  }) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  bool? select;
  @override
  void initState() {
    select = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        select = !select!;
        setState(() {});
        widget.fun(select!);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Image.network(
              widget.url,
              fit: BoxFit.contain,
            ),
          ),
          select == true
              ? Container(
                  child: Icon(Icons.check_circle),
                )
              : SizedBox.shrink(),
          select == true
              ? Container(
                  color: Colors.black.withOpacity(0.4),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
