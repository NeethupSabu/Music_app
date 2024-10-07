class Song {
  final String title;
  final String artist;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.artist,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
        title: "Mehabooba",
        url: "music/audio1.mp3",
        coverUrl: "assets/images/image1.jpg",
        artist: 'Arjith Sing'),
    Song(
        title: "Stuthi",
        url: "music/audio2.mp3",
        coverUrl: "assets/images/image2.jpg",
        artist: 'Arjith Sing'),
    Song(
        title: "Mehabooba",
        url: "music/audio3.mp3",
        coverUrl: "assets/images/images3.jpg",
        artist: 'Arjith Sing'),
    Song(
        title: "Mehabooba",
        url: "music/audio3.mp3",
        coverUrl: "assets/images/image1.jpg",
        artist: 'Arjith Sing'),
    Song(
        title: "Mehabooba",
        url: "music/audio1.mp3",
        coverUrl: "assets/images/image1.jpg",
        artist: 'Arjith Sing'),
  ];
}
