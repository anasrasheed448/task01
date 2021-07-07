import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Third Party Import
import '../models/user_model_provider.dart';
import 'screens/user_list_screen.dart';
import '../screens/user_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task',
        theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(color: Colors.white, fontSize: 15),
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(color: Colors.black),
              headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
            opacity: 20,
          ),
        ),
        home: UserListScreen(),
        routes: {
          UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
        },
      ),
    );
  }
}
