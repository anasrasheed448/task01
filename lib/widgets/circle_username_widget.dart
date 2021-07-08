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
      child: CircleAvatar(
        radius: height * 0.11,
        child: Text(
          userData.username.substring(0, 1),
          style: TextStyle(
              fontSize: height * 0.14,
              fontWeight: FontWeight.bold,
              color: Colors.white30),
        ),
      ),
    );
  }
}
