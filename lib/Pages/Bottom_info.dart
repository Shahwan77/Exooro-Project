import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    super.key,
    required this.title,
    required this.temp,
    required this.unit,
    required this.color,
    required this.width,
  });
  final String title;
  final String temp;
  final Color? color;
  final String unit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          temp,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          unit,
          style: const TextStyle(color: Colors.white),
        ),
        Stack(
          children: [
            Container(
              height: 4,
              width: 38,
              color: Colors.grey,
            ),
            Container(height: 4, width: width, color: color),
          ],
        ),
      ],
    );
  }
}
