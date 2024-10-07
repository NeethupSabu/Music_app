import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double current;
  final double total;
  final ValueChanged<double> onChanged;
  final String currentPosition;
  final String totalDuration;

  const ProgressBar({
    super.key,
    required this.current,
    required this.total,
    required this.onChanged,
    required this.currentPosition,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Column(
        children: [
          Slider(
            min: 0,
            max: total,
            value: current,
            activeColor: Colors.tealAccent,
            inactiveColor: Colors.white24,
            onChanged: onChanged,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentPosition,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  totalDuration,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
