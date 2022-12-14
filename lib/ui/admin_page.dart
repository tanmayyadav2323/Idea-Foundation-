import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:preco/login/widgets/standard_elevated_button.dart';
import 'package:preco/model/image_folder.dart';
import 'package:preco/model/video_folder.dart';
import 'package:preco/ui/image_folder_page.dart';
import 'package:sizer/sizer.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool uploadImages = true;
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit Content',
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 6.h,
                ),
                buildPhotosFolder(),
                SizedBox(
                  height: 6.h,
                ),
                buildVideoFolder()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildPhotosFolder() {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('ImageFolder').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              List<Widget> ls = [];
              for (var doc in snapshot.data!.docs) {
                ls.add(buildTile(doc['name'], () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageFolderPage(docId: doc.id,)),
                  );
                }, () async {
                  Navigator.of(context).pop();
                  await FirebaseFirestore.instance
                      .collection('ImageFolder')
                      .doc(doc.id)
                      .delete();

                  ;
                }));
              }
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Images Folder',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          name.clear();
                          uploadImages = true;
                          buildBottomSheet();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: ls,
                  )
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });
  }

  buildVideoFolder() {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('VideoFolder').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              List<Widget> ls = [];
              for (var doc in snapshot.data!.docs) {
                ls.add(buildTile(doc['name'], () {}, () async {
                  Navigator.of(context).pop();
                  await FirebaseFirestore.instance
                      .collection('VideoFolder')
                      .doc(doc.id)
                      .delete();
                }));
              }
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Videos Folder',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            name.clear();
                            uploadImages = false;
                            buildBottomSheet();
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: ls,
                  )
                ],
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });
  }

  buildBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              height: 25.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Folder Name',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextField(
                    controller: name,
                    autofocus: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  StandardElevatedButton(
                      labelText: 'Create',
                      onTap: () async {
                        if (name.text.isEmpty) return;
                        Navigator.of(context).pop();
                        uploadImages
                            ? await FirebaseFirestore.instance
                                .collection('ImageFolder')
                                .add(
                                  ImageFolder(
                                      id: null,
                                      name: name.text,
                                      urls: []).toMap(),
                                )
                            : await FirebaseFirestore.instance
                                .collection('VideoFolder')
                                .add(VideoFolder(
                                    id: null,
                                    name: name.text,
                                    videos: []).toMap());
                      })
                ],
              ),
            ),
          );
        });
  }

  buildTile(String name, Function() onTap, Function() delete) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: ListTile(
          onTap: null,
          title: Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  useSafeArea: true,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      "Are you sure ?",
                      textAlign: TextAlign.left,
                    ),
                    content: Text(
                        'This action will permanently delete it.You will no longer be able to access the folder.'),
                    actions: [
                      ElevatedButton(
                        onPressed: delete,
                        child: const Text(
                          'Delete',
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancel',
                        ),
                      )
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
