import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model_provider.dart';
import '../widgets/text_username_widget.dart';
import '../widgets/circle_username_widget.dart';
import '../widgets/city_widget.dart';
import '../widgets/payment_box_widget.dart';
import '../widgets/room_detail_widget.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = "user-detail-screen";
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final username = ModalRoute.of(context)!.settings.arguments as String;
    final userData = 
        Provider.of<UserDataProvider>(context,).getSingleUserData(username);
    AppBar appBar;
    return Scaffold(
      appBar: appBar = AppBar(
        title: const Text("User Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          //hellllooo
          height: height - appBar.preferredSize.height,
          width: width,
          color: Colors.grey[800],
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleUsernameWidget(
                  width: width, height: height, userData: userData),
              SizedBox(height: 0.01 * height),
              TextUsername(width: width, username: username),
              SizedBox(height: 0.03 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PaymentBoxWidget(
                      width: width, height: height, userData: userData),
                  LocationWidget(width: width, userData: userData),
                ],
              ),
              SizedBox(height: height * 0.03),
              RoomDetailWidget(width: width, height: height, userData: userData)
            ],
          ),
        ),
      ),
    );
  }
}
