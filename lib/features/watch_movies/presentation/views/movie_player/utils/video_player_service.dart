import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerService {
  late YoutubePlayerController _controller;
  final String videoId;
  final Function()? onVideoEnd;

  YouTubePlayerService({
    required this.videoId,
    this.onVideoEnd,
  }) {
    _initializeController();
  }

  void _initializeController() {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: false,
        forceHD: true,
      ),
    )..addListener(_controllerListener);
  }

  void _controllerListener() {
    if (_controller.value.playerState == PlayerState.ended) {
      onVideoEnd?.call();
    }
  }

  YoutubePlayerController get controller => _controller;

  void dispose() {
    _controller.removeListener(_controllerListener);
    _controller.dispose();
  }
}