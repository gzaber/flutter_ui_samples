import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF262B33),
              const Color(0xFF262B33).withOpacity(0.1),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            imageUrl,
            width: 33,
            height: 33,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return SizedBox(
                key: Key('customImageButtonKey$imageUrl'),
                width: 33,
                height: 33,
                child: const Icon(Icons.error_outline, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
