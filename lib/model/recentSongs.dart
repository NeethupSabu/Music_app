import 'package:musicapp/model/song_model.dart';

class Recentsongs {
  final String title;
  final List<Song> song;

  final String imageUrl;

  Recentsongs({
    required this.song,
    required this.title,
    required this.imageUrl,
  });

  static List<Recentsongs> recentsong= [
    Recentsongs(
      song: Song.songs, 
      title: "Malayalam Mix", 
      imageUrl: "https://resources.tidal.com/images/3fa09f64/df68/4945/92ab/e6cb2e3dffce/640x640.jpg"),
    Recentsongs(
      song: Song.songs, 
      title: "Malayalam Mix", 
      imageUrl: "https://resources.tidal.com/images/3fa09f64/df68/4945/92ab/e6cb2e3dffce/640x640.jpg"),
    Recentsongs(
      song: Song.songs, 
      title: "Malayalam Mix", 
      imageUrl: "https://resources.tidal.com/images/3fa09f64/df68/4945/92ab/e6cb2e3dffce/640x640.jpg"),
    Recentsongs(
      song: Song.songs, 
      title: "Malayalam Mix", 
      imageUrl: "https://resources.tidal.com/images/3fa09f64/df68/4945/92ab/e6cb2e3dffce/640x640.jpg")
  ];
}
