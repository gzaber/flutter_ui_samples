import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/widgets/widgets.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    this.iconSize = 22,
    this.radius = 20,
    this.favoriteColor = Colors.black,
    this.notFavoriteColor = Colors.black,
  }) : super(key: key);

  final bool isFavorite;
  final double iconSize;
  final double radius;
  final Color favoriteColor;
  final Color notFavoriteColor;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      icon: _isFavorite ? Icons.favorite : Icons.favorite_outline,
      iconSize: widget.iconSize,
      radius: widget.radius,
      iconColor: _isFavorite ? widget.favoriteColor : widget.notFavoriteColor,
    );
  }
}
