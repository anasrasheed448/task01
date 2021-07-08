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
    List<Widget> property = userData.propertyAllocated
        .map(
            (property) => showUserData(context, "Property Allocatted:", property))
        .toList();
    return Card(
      color: Colors.grey[800],
      elevation: 4,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width * 0.04),
          width: width,
          height: height < 500 ? height * 0.25 : height * 0.3,
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
              SizedBox(height: height * 0.015),
              Container(
                child: Column(children: property),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showUserData(BuildContext ctx, String title, dynamic userData) {
    return Container(
      padding: EdgeInsets.only(left: width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: width * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: width * 0.03),
          FittedBox(
            child: Text(
              userData,
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
