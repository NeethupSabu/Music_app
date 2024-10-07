import 'package:flutter/material.dart';

class SongImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const SongImage({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size * 0.19),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageUrl,
          width: size * 0.75,
          height: size * 0.75,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
