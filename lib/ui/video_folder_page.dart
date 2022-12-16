import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:preco/model/video_files.dart';
import 'package:preco/model/video_folder.dart';
import 'package:preco/ui/add_video_page.dart';
import 'package:preco/ui/video_view_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideoFolderPage extends StatefulWidget {
  final String docId;
  const VideoFolderPage({
    Key? key,
    required this.docId,
  }) : super(key: key);
 
  @override
  State<VideoFolderPage> createState() => _VideoFolderPageState();
}

class _VideoFolderPageState extends State<VideoFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("VideoFolder")
                  .doc(widget.docId)
                  .get(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  VideoFolder videofolder =
                      VideoFolder.fromMap(snapshot.data!.data()!);

                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            videofolder.name,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddVideoPage(
                                            docId: widget.docId,
                                          )),
                                );
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                      Column(
                        children: videofolder.videos.map((video) {
                          return buildTile(video, () async {
                            var videoCopy = videofolder.videos;
                            videoCopy.remove(video);
                            var newVideoFolder =
                                videofolder.copyWith(videos: videoCopy);
                            Fluttertoast.showToast(msg: 'Deleting...');
                            await FirebaseFirestore.instance
                                .collection('VideoFolder')
                                .doc(widget.docId)
                                .set(newVideoFolder.toMap())
                                .then((value) {
                              setState(() {});
                            });
                          }) as Widget;
                        }).toList(),
                      )
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }

  buildTile(VideoFiles video, Function() onTap) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
        title: Text(video.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoViewPage(video: video),
            ),
          );
        },
        trailing: IconButton(onPressed: onTap, icon: Icon(Icons.delete)),
      ),
    );
  }
}
