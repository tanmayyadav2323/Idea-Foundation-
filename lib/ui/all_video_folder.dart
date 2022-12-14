import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:preco/model/video_files.dart';
import 'package:preco/model/video_folder.dart';
import 'package:preco/ui/video_files_page.dart';
import 'package:sizer/sizer.dart';

class AllVideoFolderPage extends StatefulWidget {
  const AllVideoFolderPage({super.key});

  @override
  State<AllVideoFolderPage> createState() => _AllVideoFolderPageState();
}

class _AllVideoFolderPageState extends State<AllVideoFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future:
                  FirebaseFirestore.instance.collection('VideoFolder').get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  List<VideoFolder> folders = snapshot.data!.docs.map((e) {
                    return VideoFolder.fromMap(e.data());
                  }).toList();
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Videos",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Column(
                          children: folders
                              .map((e) => buildVideoFolder(e) as Widget)
                              .toList(),
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }

  buildVideoFolder(VideoFolder videoFolder) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoFilesPage(
                      videoFolder: videoFolder,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: ListTile(
          title: Text(
            videoFolder.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
