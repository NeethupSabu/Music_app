import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicapp/model/song_model.dart';

class FavoritePage extends StatelessWidget {
  final List<Song> favoriteSongs;

  const FavoritePage({super.key, required this.favoriteSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar to match the design
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffec24f0),
              Color.fromARGB(255, 92, 73, 218),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Top section with the favorite icon, profile image, and menu icon
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      // Handle favorite icon press
                    },
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/profile_image.png'), // Replace with your profile image path
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      // Handle menu icon press
                    },
                  ),
                ],
              ),
            ),
            // Songs List
            Expanded(
              child: favoriteSongs.isEmpty
                  ? const Center(
                      child: Text(
                        'No favorite songs yet.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: favoriteSongs.length,
                      itemBuilder: (context, index) {
                        final song = favoriteSongs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                // Song title and artist information
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        song.artist,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Play button
                                IconButton(
                                  icon: const Icon(Icons.play_circle,
                                      color: Colors.teal, size: 32),
                                  onPressed: () {
                                    // Play the selected favorite song
                                    AudioPlayer().play(AssetSource(song.url));
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
