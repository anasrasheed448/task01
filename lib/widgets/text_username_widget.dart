import 'package:flutter/material.dart';

class TextUsername extends StatelessWidget {
  const TextUsername({
    required this.width,
    required this.username,
  });

  final double width;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: width * 0.5,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          username,
          style: TextStyle(
            fontSize: width * 0.025,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
