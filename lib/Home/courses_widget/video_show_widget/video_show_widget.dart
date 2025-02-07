// Video Player Screen
import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:provider/provider.dart';
import 'video_show_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<VideoPlayerProvider>(context, listen: false)
          .loadVideo(widget.videoPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider =
        Provider.of<VideoPlayerProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Video Player")),
      body: Center(
        child: Video(
          controller: videoProvider.controller,
        ),
      ),
    );
  }
}
