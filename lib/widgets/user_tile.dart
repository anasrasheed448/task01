import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todays/screens/user_detail_screen.dart';

class UserTile extends StatelessWidget {
  final String title;
  final bool status;
  UserTile({required this.title, required this.status});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 2,
      child: ListTile(
          leading: Icon(
            Icons.paid,
            color: status ? Colors.green : Colors.red,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
