import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationalVideos extends StatefulWidget {
  final String videoId;
  final String videoName;
  final String videoInfo;
  EducationalVideos({
    Key? key,
    required this.videoId,
    required this.videoName,
    required this.videoInfo,
  }) : super(key: key);

  @override
  State<EducationalVideos> createState() => _EducationalVideosState();
}

class _EducationalVideosState extends State<EducationalVideos> {
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          loop: true,
          showLiveFullscreenButton: false),
    )..addListener(listener);
    super.initState();
  }

  final bool _isPlayerReady = false;

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.black,
        child: YoutubePlayer(
          controller: _controller,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {},
          bottomActions: [
            SizedBox(width: 14.0.w),
            CurrentPosition(),
            SizedBox(width: 8.0.w),
            ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                    backgroundColor: Theme.of(context).bottomAppBarColor,
                    bufferedColor: Colors.white.withOpacity(0.2),
                    handleColor: const Color(0XFFFCAE69),
                    playedColor: Color(0XFFFCAE69))),
            SizedBox(width: 8.0.w),
            RemainingDuration(),
            SizedBox(width: 14.0.w),
          ],
        ),
      ),
    );
  }
}
