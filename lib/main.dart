import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Third Party Import
import '../models/user_model_provider.dart';
import 'screens/user_list_screen.dart';
import '../screens/user_detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<int> internetConnection() async {
    final internetConnection = await InternetAddress.lookup('flutter.dev');
    if (internetConnection.isNotEmpty) return 0;
    return 1;
  }

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    internetConnection();
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
              headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
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
          primaryColor: Colors.blue,
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
