import 'package:flutter/material.dart';
import 'colors.dart';
import 'home_view.dart';

class FavoriteButton extends StatefulWidget {
  final String itemName;

  FavoriteButton({required this.itemName});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          if (isFavorite) {
            myFavItems.add(widget.itemName);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to Favorites')));
          } else {
            myFavItems.remove(widget.itemName);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Removed from Favorites')));
          }
        });
      },
      child: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.pink : AppColors.black_45,
        size: 30,
      ),
    );
  }
}
