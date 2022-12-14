import 'package:flutter/material.dart';

import 'package:preco/model/video_files.dart';
import 'package:preco/ui/youtube_videos.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoViewPage extends StatefulWidget {
  final VideoFiles video;
  const VideoViewPage({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
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
                widget.video.title,
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              EducationalVideos(
                  videoId: widget.video.code,
                  videoName: widget.video.title,
                  videoInfo: widget.video.content),
              SizedBox(
                height: 5.h,
              ),
              Text(
                widget.video.content,
                style: TextStyle(fontSize: 12.sp, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  launch(widget.video.link);
                },
                child: Text(
                  widget.video.link,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
