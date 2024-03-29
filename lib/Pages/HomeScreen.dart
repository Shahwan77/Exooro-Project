import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/WeatherProvider.dart';
import 'Bottom_info.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  String location = 'Kochi';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NetworkHelper(),
      child: Consumer<NetworkHelper>(
        builder: (context, networkHelper, _) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1581608198007-4801faa3859a?q=80&w=1430&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              child: FutureBuilder(
                  future: networkHelper.getData(location),
                  builder: (context, AsyncSnapshot asyncSnapshot) {
                    if (!asyncSnapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      log("");
                      String temperature = ((asyncSnapshot.data.main.temp - 273)
                          .toStringAsFixed(1));
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: 'Search',
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              onChanged: (value) =>
                                                  location = value,
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      );
                                    });
                              },
                            ),
                            title: const Text(
                              '  Weather App',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(
                              Icons.dashboard,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 40,
                          ),
                          Text(
                            asyncSnapshot.data.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height / 2),
                          Text(
                            ("$temperature ℃"),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.w100),
                          ),
                          Row(children: [
                            double.parse(temperature) <= 2
                                ? const Icon(
                                    Icons.cloudy_snowing,
                                    color: Colors.white,
                                    size: 29,
                                  )
                                : double.parse(temperature) >= 15
                                    ? const Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 29,
                                      )
                                    : double.parse(temperature) < 15
                                        ? const Icon(
                                            Icons.wb_cloudy_sharp,
                                            color: Colors.white,
                                            size: 29,
                                          )
                                        : const Icon(
                                            Icons.sunny,
                                            color: Colors.white,
                                            size: 29,
                                          ),
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width / 40),
                            Text(
                              asyncSnapshot.data.weather[0].main,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )
                          ]),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 200,
                          ),
                          const Divider(
                            thickness: 2.5,
                            height: 7,
                          ),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height / 80),
                          Row(
                            children: [
                              const SizedBox(
                                width: 28,
                              ),
                              BottomInfo(
                                // color: Colo,
                                title: 'Wind',
                                temp: asyncSnapshot.data.wind.speed.toString(),
                                unit: 'Km/h',
                                color: Colors.orange,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              BottomInfo(
                                temp: asyncSnapshot.data.clouds.all.toString(),
                                // color: Colo,
                                title: "Clouds",
                                unit: '%',
                                color: Colors.red,
                                width: 4,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              BottomInfo(
                                // color: Colo,
                                title: "Humidity",
                                unit: '%',
                                temp:
                                    asyncSnapshot.data.main.humidity.toString(),
                                color: Colors.green,
                                width: 18,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              BottomInfo(
                                title: 'Feels Like',
                                temp: ((asyncSnapshot.data.main.feelsLike - 273)
                                    .toStringAsFixed(1)),
                                unit: 'C°',
                                color: Colors.blue,
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      );
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
