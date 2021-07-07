import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserData {
  final String username;
  // final List<dynamic> propertyAllocated;
  final bool status;
  final String roomType;
  final double depositeAmount;
  final String roomAllotted;
  final String city;

  UserData({
    required this.username,
    // required this.propertyAllocated,
    required this.status,
    this.roomType = "ss",
    this.depositeAmount = 90,
    this.roomAllotted = "single",
    this.city = "Karachi",
  });
}

class UserDataProvider with ChangeNotifier {
  final List<UserData> _userList = [];

  List<UserData> get userList {
    return [..._userList];
  }

  UserData getSingleUserData(String username) {
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
        UserData(
            username: decodedData["records"][i]["fields"]["Name"],
            // propertyAllocated: decodedData["records"][i]["fields"]
            //     ["Property Allotted"],
            status:
                decodedData["records"][i]["fields"]["Deposit Status"] == "Paid"
                    ? true
                    : false,
            city: decodedData["records"][i]["fields"]["City"],
            roomType: decodedData["records"][i]["fields"]["Room Type"],
            depositeAmount: decodedData["records"][i]["fields"]
                ["Deposit Amount"],
            roomAllotted: decodedData["records"][i]["fields"]["Room Allotted"]),
      );
    }
    notifyListeners();
  }
}
