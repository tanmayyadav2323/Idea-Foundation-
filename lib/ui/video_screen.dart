import 'package:flutter/material.dart';
import 'package:preco/ui/youtube_videos.dart';
import 'package:sizer/sizer.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
                  "Videos",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                EducationalVideos(
                    videoId: "_aajchT0z3s", videoInfo: "", videoName: ""),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Patriotic dance by kids of  IDEA Foundation learning centre",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                EducationalVideos(
                    videoId: "Tzc7FSsWvNE", videoInfo: "", videoName: ""),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Group of Undergrads of SIT interacted and taught kids at IDEA foundation learning centre",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
