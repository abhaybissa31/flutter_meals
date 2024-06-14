import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
    const CardData({
    Key? key,
    required this.imageAddress,
    required this.imageText,
    required this.id,
    required this.onSelectCategory,
  }) : super(key: key);

  final String imageAddress;
  final String imageText;
  final String id;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: InkWell(
        onTap: () {
          onSelectCategory();
        },
        splashFactory:InkRipple.splashFactory,
      splashColor: Colors.white38,
      borderRadius: BorderRadius.circular(18.0),
      enableFeedback: true,
      radius:BouncingScrollSimulation.maxSpringTransferVelocity,// Match the border radius of the card

        child: Card(
          shadowColor: const Color.fromARGB(255, 73, 72, 72),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Stack(
            children: [
              // Image with BoxFit.cover to fill the card
              Positioned.fill(
                child: Image.asset(
                  imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
              // Container for bottom content with some padding
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
                          style: const TextStyle(color: Colors.white),
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
      ),
    );
  }
}
