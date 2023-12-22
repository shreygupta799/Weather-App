//import "dart:ui";

import "package:flutter/material.dart";
import "package:weather_app/Otherinfo.dart";
import "package:weather_app/weatherForecast.dart";

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Weathet App"), centerTitle: true, actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // Add your refresh logic here
            // print('Refresh button pressed');
          },
        ),
      ]),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(children: [
          //main card
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "300°F",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.cloud,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rain",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          //weather forecast card
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Weather Forecast",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                weatherForecast(),
                weatherForecast(),
                weatherForecast(),
                weatherForecast(),
                weatherForecast(),
                weatherForecast()
              ],
            ),
          ),
          //addtiional info card
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Additional Information",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Otherinfo()
        ]),
      ),
    );
  }
}
