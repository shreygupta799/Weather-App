//import "dart:ui";

import "package:flutter/material.dart";

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
          SizedBox(height: 12),
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
          Row(
            children: [
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 25,
                    ),
                    Text(
                      "Humidity",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "94",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Icon(
                      Icons.wind_power,
                      size: 25,
                    ),
                    Text(
                      "Wind Speed",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "7.67",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Icon(
                      Icons.umbrella,
                      size: 25,
                    ),
                    Text(
                      "Pressure",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "1006",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class weatherForecast extends StatelessWidget {
  const weatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: const Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            children: [
              Text(
                "09:00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(Icons.cloud, size: 29),
              SizedBox(
                height: 10,
              ),
              Text("264.34",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
