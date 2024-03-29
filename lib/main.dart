import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navKey = GlobalKey();
GlobalKey<ScaffoldMessengerState> notifKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      scaffoldMessengerKey: notifKey,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
