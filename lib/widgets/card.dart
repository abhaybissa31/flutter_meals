import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData({
    required this.imageAddress,
    required this.imageText,
    required this.id,
    super.key,
    this.onSelectCategory,
  });

  final String imageAddress;
  final String imageText;
  final String id;
  final void Function()? onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: onSelectCategory,
      splashFactory: InkSplash.splashFactory,
      splashColor: Colors.white54,
      borderRadius: BorderRadius.circular(15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imageAddress,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        imageText,
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
