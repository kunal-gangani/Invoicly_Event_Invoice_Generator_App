import 'package:flutter/material.dart';

Widget CarouselContainer({
  required BuildContext context,
  required String imageUrl,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 5.0,
    ),
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );
}
