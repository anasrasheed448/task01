import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todays/models/user_model_provider.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = "user-detail-screen";
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final username = ModalRoute.of(context)!.settings.arguments as String;
    final userData =
        Provider.of<UserDataProvider>(context).getSingleUserData(username);
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
              Center(
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
              ),
              SizedBox(height: 0.01 * height),
              Center(
                  child: Container(
                width: 180,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
              SizedBox(height: 0.02 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: width * 0.45,
                    height: height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment:",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white,
                              ),
                              child: userData.status
                                  ? const Text("Paid")
                                  : const Text("Unpaid"),
                            )
                          ],
                        ),
                        SizedBox(height: 0.01 * height),
                        Center(
                          // margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            userData.depositeAmount.toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_city,
                        ),
                        SizedBox(width: 0.01 * width),
                        FittedBox(
                          child: Text(
                            userData.city,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: EdgeInsets.all(width * 0.02),
                width: width,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
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
                    showUserData(
                        context, "Room Allotted: ", userData.roomAllotted),
                    SizedBox(height: height * 0.015),
                    showUserData(context, "Room Type: ", userData.roomType),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showUserData(BuildContext ctx, String title, String userData) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(ctx).textTheme.headline3,
          ),
          const SizedBox(width: 20),
          Text(
            userData,
            style: Theme.of(ctx).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
