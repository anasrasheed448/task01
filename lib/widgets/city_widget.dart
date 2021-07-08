import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/user_model_provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    required this.width,
    required this.userData,
  });

  final double width;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.3,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.location_city),
          SizedBox(width: 0.01 * width),
          FittedBox(
            child: Text(
              userData.city,
              style: TextStyle(
                  fontSize: width < 270 ? width * 0.04 : width * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
