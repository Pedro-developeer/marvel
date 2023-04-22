import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CharacterCardWidget({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 8,
          child: SizedBox(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: SizedBox(
                height: 227,
                width: 157,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: 50,
            width: 157,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: '.SF UI Display',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
