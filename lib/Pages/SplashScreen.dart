import 'package:flutter/material.dart';
import 'dart:async';

import '../Utils/Nav_helper.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Nav.toAll(LocationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weatherly",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.sunny_snowing,
                  color: Colors.orangeAccent,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
