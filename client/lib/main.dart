import 'package:flutter/material.dart';
import 'package:markus/Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Markus',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // primarySwatch: Colors.black,
        primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'home': (context) => HomePage(),
        'settings': (context) => Settings(),
        'account': (context) => Account(),
        'login': (context) => Login(),
        'signin': (context) => Signin(),
        'cart': (context) => CartScreen(),
      },
      initialRoute: 'home',
    );
  }
}
