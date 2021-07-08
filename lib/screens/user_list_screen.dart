import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model_provider.dart';
import '../widgets/user_tile_widget.dart';

class UserListScreen extends StatelessWidget {
  Future<void> _refreshScreen(BuildContext ctx) async {
    await Provider.of<UserDataProvider>(ctx, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      //    var gett = UserDataProvider();
      // gett.getData();
      // print(gett.userList[0].propertyAllocated);
      body: Container(
        margin: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: _refreshScreen(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () => _refreshScreen(context),
                child: Consumer<UserDataProvider>(
                  builder: (context, userData, _) => ListView.builder(
                    itemBuilder: (ctx, i) => UserTile(
                      title: userData.userList[i].username,
                      status: userData.userList[i].status,
                      propertyAllocated: 
                        userData.userList[i].propertyAllocated[0].toString()
                      
                    ),
                    itemCount: userData.userList.length,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
