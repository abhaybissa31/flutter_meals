import 'package:flutter/material.dart';
class CardData extends StatelessWidget {
  const CardData({required this.imageAddress, required this.imageText, required this.id});
  final String imageAddress;
  final String imageText;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        shadowColor: const Color.fromARGB(255, 73, 72, 72),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.only(left: 6,right:6,top: 10),
      
        child: Stack(
          children: [
            // Image with BoxFit.cover to fill the card
            Row( // Use Row or Column as needed
              children: [
                Expanded(
                  child: Image.asset(
                    height: double.infinity,
                    imageAddress,
                    fit:BoxFit.cover,
                  ),
                ),
              ],
            ),
            // Container for bottom content with some padding
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  children: [
                    Expanded(child: Text(imageText, style: const TextStyle(color: Colors.white))),
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
