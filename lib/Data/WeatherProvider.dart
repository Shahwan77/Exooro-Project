import 'dart:math';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/Models.dart';

const String apiKey = '426e7ff9ecfb1ed70777cd2a6ee94ec1';

class NetworkHelper extends ChangeNotifier {
  Future getData(String location) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return WeatherAppModel.fromJson(jsonDecode(data));
    } else {
      log(response.statusCode);
    }
  }
}
