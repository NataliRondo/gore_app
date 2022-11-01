// ignore_for_file: unnecessary_null_comparison, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gore_app/routes.dart';
import 'package:gore_app/view/loginView.dart';
import 'package:gore_app/view/splash.dart';
void main() {
  runApp( const MaterialApp( debugShowCheckedModeBanner: false,
    home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() =>  _MyAppState();
}

//class MyApp extends StatelessWidget {
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginView(),
      routes: routes,
    );
  }
}
