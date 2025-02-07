import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerProvider extends ChangeNotifier {
  late Player _player;
  late VideoController _controller;

  Player get player => _player;
  VideoController get controller => _controller;

  VideoPlayerProvider() {
    _player = Player();
    _controller = VideoController(_player);
  }

  void loadVideo(String videoPath) {
    _player.open(Media(videoPath));
    notifyListeners(); // Notify widgets in case they need updates
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
