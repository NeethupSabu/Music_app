import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicapp/Screen/FavouriteScreen.dart';
import 'package:musicapp/model/song_model.dart';
import 'package:musicapp/widgets/PlayViewWidgets/audioControls.dart';
import 'package:musicapp/widgets/PlayViewWidgets/playAppbar.dart';
import 'package:musicapp/widgets/PlayViewWidgets/slider.dart';
import 'package:musicapp/widgets/PlayViewWidgets/songCover.dart';
import 'package:musicapp/widgets/PlayViewWidgets/songInfo.dart';

class PlayView extends StatefulWidget {
  final Song song;

  const PlayView({super.key, required this.song});

  @override
  _PlayViewState createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isFavorite = false;
  List<Song> favoriteSongs = [];

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  void toggleFavorite(Song song) {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        favoriteSongs.add(song);
      } else {
        favoriteSongs.remove(song);
      }
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.setSource(AssetSource(widget.song.url));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffec24f0), Color.fromARGB(255, 92, 73, 218)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            CustomAppBar(
              isFavorite: isFavorite,
              onBackPressed: () => Navigator.pop(context),
              onFavoritePressed: () {
                setState(() {
                  toggleFavorite(widget.song); // Toggle favorite status
                });
              },
              onShowFavorites: () {
                // Navigate to the Favorite Page with the favoriteSongs list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritePage(favoriteSongs: favoriteSongs),
                  ),
                );
              },
            ),
            SongImage(imageUrl: widget.song.coverUrl, size: screenWidth),
            SongDetails(title: widget.song.title, artist: widget.song.artist),
            ProgressBar(
              current: position.inSeconds.toDouble(),
              total: duration.inSeconds.toDouble(),
              currentPosition: formatDuration(position),
              totalDuration: formatDuration(duration),
              onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await audioPlayer.seek(newPosition);
              },
            ),
            ControlButtons(
              isPlaying: isPlaying,
              onPlayPausePressed: () {
                if (isPlaying) {
                  audioPlayer.pause();
                } else {
                  audioPlayer.resume();
                }
              },
              onSkipPrevious: () {
                // Skip to previous logic
              },
              onSkipNext: () {
                // Skip to next logic
              },
            ),
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
