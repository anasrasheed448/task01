import 'package:flutter/material.dart';
import '../screens/user_detail_screen.dart';

class UserTile extends StatelessWidget {
  final String title;
  final String propertyAllocated;
  final bool status;
  const UserTile({
    required this.title,
    required this.status,
    required this.propertyAllocated,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 2,
      child: ListTile(
          minVerticalPadding: 3,
          leading: Container(
            width: 50,
            child: Column(
              children: [
                Icon(
                  Icons.paid,
                  color: status ? Colors.green : Colors.red,
                ),
                FittedBox(
                  child: Text(
                    status ? "paid".toUpperCase() : "unpaid".toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Property :" + propertyAllocated),
          trailing: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              Navigator.pushNamed(context, UserDetailScreen.routeName,
                  arguments: title);
            },
          )),
    );
  }
}
