
import 'package:flutter/material.dart';
import '../models/user_model_provider.dart';

class CircleUsernameWidget extends StatelessWidget {
  const CircleUsernameWidget({
    required this.width,
    required this.height,
    required this.userData,
  });

  final double width;
  final double height;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * 0.35,
        height: height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            userData.username.substring(0, 1),
            style: TextStyle(
                fontSize: width * 0.20,
                fontWeight: FontWeight.bold,
                color: Colors.white30),
          ),
        ),
      ),
    );
  }
}
