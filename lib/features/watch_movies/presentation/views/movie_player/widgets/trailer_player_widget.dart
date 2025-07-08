import 'package:flutter/material.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/utils/orientation_service.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/utils/video_player_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final MovieVideoResult video;

  const TrailerPlayerScreen({super.key, required this.video});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  late final YouTubePlayerService _playerService;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    _setLandscapeOrientation();
  }

  void _initializePlayer() {
    _playerService = YouTubePlayerService(
      videoId: widget.video.key,
      onVideoEnd: _handleVideoEnd,
    );
  }

  Future<void> _setLandscapeOrientation() async {
    await OrientationService.setLandscape();
  }

  void _handleVideoEnd() {
    _returnToPortraitAndClose();
  }

  Future<void> _returnToPortraitAndClose() async {
    await OrientationService.setPortrait();
    if (mounted) {
      // Inform MoviePlayerView to pop itself
      Navigator.of(context).maybePop(true); // Use `maybePop` to avoid crash
    }
    ;
  }

  @override
  void dispose() {
    _playerService.dispose();
    OrientationService.setPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerService.controller,
        onReady: () => _playerService.controller.play(),
      ),
      builder: (context, player) => _PlayerScaffold(player: player),
    );
  }
}

class _PlayerScaffold extends StatelessWidget {
  final Widget player;

  const _PlayerScaffold({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: player),
            const Positioned(
              top: 20,
              right: 20,
              child: _CloseButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
