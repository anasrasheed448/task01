import 'package:flutter/material.dart';
import '../models/user_model_provider.dart';

class RoomDetailWidget extends StatelessWidget {
  const RoomDetailWidget({
    required this.width,
    required this.height,
    required this.userData,
  });
  final double width;
  final double height;
  final UserDataModel userData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      width: width,
      height: height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Room Details",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: height * 0.02),
          showUserData(context, "Room Allotted: ", userData.roomAllotted),
          SizedBox(height: height * 0.015),
          showUserData(context, "Room Type: ", userData.roomType),
        ],
      ),
    );
  }

  Widget showUserData(BuildContext ctx, String title, String userData) {
    return Container(
      padding: EdgeInsets.only(left: width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(ctx).textTheme.headline3,
          ),
          SizedBox(width: width * 0.03),
          Text(
            userData,
            style: Theme.of(ctx).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
