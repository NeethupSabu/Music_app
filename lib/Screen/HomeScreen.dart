import 'package:flutter/material.dart';

import 'package:musicapp/bottomNav.dart';
import 'package:musicapp/model/recentSongs.dart';
import 'package:musicapp/model/song_model.dart';
import 'package:musicapp/widgets/RecentHeader.dart';
import 'package:musicapp/widgets/recentPlay.dart';
import 'package:musicapp/widgets/sectiontitle.dart';
import 'package:musicapp/widgets/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<Song> songs = Song.songs;
    List<Recentsongs> recentsong = Recentsongs.recentsong;

    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Vini,',
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'What do you want to hear today?',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SearchBar(screenWidth: screenWidth),
                      const SizedBox(height: 20),
                      const SectionTitle(title: "Songs For You"),
                      SizedBox(
                        height: screenWidth * 0.47,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            return SongCard(
                              screenWidth: screenWidth,
                              songs: songs[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      RecentPlayHeader(screenWidth: screenWidth),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recentsong.length,
                        itemBuilder: (context, index) {
                          return RecentPlayCard(songs: songs[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenWidth * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: const Icon(Icons.mic, color: Colors.black),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.black),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: widget.screenWidth * 0.03),
        ),
      ),
    );
  }
}
