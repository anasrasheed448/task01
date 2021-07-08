import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserDataModel {
  final String username;
  final List<dynamic> propertyAllocated;
  final bool status;
  final String roomType;
  final int depositeAmount;
  final String roomAllotted;
  final String city;

  UserDataModel({
    required this.username,
    required this.propertyAllocated,
    required this.status,
    this.roomType = "ss",
    this.depositeAmount = 90,
    this.roomAllotted = "single",
    this.city = "Karachi",
  });
}

class UserDataProvider with ChangeNotifier {
  final List<UserDataModel> _userList = [];

  List<UserDataModel> get userList {
    return [..._userList];
  }

  UserDataModel getSingleUserData(String username) {
    return userList.firstWhere((userData) => userData.username == username);
  }

  Future<void> getData() async {
    const String url =
        "https://api.airtable.com/v0/appv4eR0NsjMOdU1p/In-house%20Members";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer keym9ALhqWWHRWcsN",
    });
    final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
    for (int i = 0; i < decodedData["records"].length; i++) {
      _userList.add(
        UserDataModel(
          username: decodedData["records"][i]["fields"]["Name"],
          status:
              decodedData["records"][i]["fields"]["Deposit Status"] == "Paid"
                  ? true
                  : false,
          propertyAllocated: decodedData["records"][i]["fields"]
              ["Property Allotted"],
          city: decodedData["records"][i]["fields"]["City"],
          roomType: decodedData["records"][i]["fields"]["Room Type"],
          depositeAmount: decodedData["records"][i]["fields"]["Deposit Amount"],
          roomAllotted: decodedData["records"][i]["fields"]["Room Allotted"],
        ),
      );
    }
    notifyListeners();
  }
}
