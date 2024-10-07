import 'package:flutter/material.dart';

class RecentPlayHeader extends StatelessWidget {
  const RecentPlayHeader({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recent Play',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
