import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onShowFavorites;

  const CustomAppBar({
    super.key,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onShowFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Playing Now'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPressed,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.tealAccent : Colors.white,
          ),
          onPressed: onFavoritePressed, // Toggle favorite status
        ),
        IconButton(
          icon: const Icon(Icons.list),
          onPressed: onShowFavorites, // Navigate to the favorites page
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
