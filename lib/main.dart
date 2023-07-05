import 'package:example1/home/tabbar_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:example1/home/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white24, statusBarBrightness: Brightness.dark));

    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          appBarTheme: AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          tabBarTheme:
              TabBarTheme(labelColor: CupertinoColors.activeBlue, unselectedLabelColor: CupertinoColors.inactiveGray),
        ),
        home: TwitterTabbarView());
  }
}
