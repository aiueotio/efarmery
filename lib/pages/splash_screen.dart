import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'login_screen.dart'; // Import the login screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      // Replace 2 with the desired duration in seconds
      navigateToLogin(context);
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
    );
  }
}
