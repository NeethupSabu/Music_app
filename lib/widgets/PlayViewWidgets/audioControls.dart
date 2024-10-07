import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onSkipPrevious;
  final VoidCallback onSkipNext;

  const ControlButtons({
    super.key,
    required this.isPlaying,
    required this.onPlayPausePressed,
    required this.onSkipPrevious,
    required this.onSkipNext,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: screenWidth * 0.1,
            icon: const Icon(Icons.skip_previous_rounded, color: Colors.white),
            onPressed: onSkipPrevious,
          ),
          SizedBox(width: screenWidth * 0.12),
          CircleAvatar(
            radius: screenWidth * 0.08,
            backgroundColor: Colors.tealAccent,
            child: IconButton(
              iconSize: screenWidth * 0.1,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
              ),
              onPressed: onPlayPausePressed,
            ),
          ),
          SizedBox(width: screenWidth * 0.12),
          IconButton(
            iconSize: screenWidth * 0.1,
            icon: const Icon(Icons.skip_next_rounded, color: Colors.white),
            onPressed: onSkipNext,
          ),
        ],
      ),
    );
  }
}
