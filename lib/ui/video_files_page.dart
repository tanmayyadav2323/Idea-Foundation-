import 'package:flutter/material.dart';
import 'package:preco/login/widgets/standard_elevated_button.dart';

import 'package:preco/model/video_files.dart';
import 'package:preco/model/video_folder.dart';
import 'package:preco/ui/video_view_page.dart';
import 'package:preco/ui/youtube_videos.dart';
import 'package:sizer/sizer.dart';

class VideoFilesPage extends StatefulWidget {
  final VideoFolder videoFolder;
  const VideoFilesPage({
    Key? key,
    required this.videoFolder,
  }) : super(key: key);

  @override
  State<VideoFilesPage> createState() => _VideoFilesPageState();
}

class _VideoFilesPageState extends State<VideoFilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.videoFolder.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  children: widget.videoFolder.videos.map((e) {
                    return buildCard(e) as Widget;
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCard(VideoFiles videoFiles) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(4),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          EducationalVideos(
            videoId: videoFiles.code,
            videoName: videoFiles.title,
            videoInfo: videoFiles.content,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            videoFiles.title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoViewPage(
                            video: videoFiles,
                          )));
            },
            child: Text(
              'Know More',
              style: TextStyle(fontSize: 8.sp),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }
}
