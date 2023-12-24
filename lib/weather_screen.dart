//import "dart:ui";

import "dart:convert";
import "package:intl/intl.dart";

import "package:flutter/material.dart";
import "package:weather_app/Otherinfo.dart";
import "package:weather_app/secrets.dart";
import "package:weather_app/weatherForecast.dart";
import "package:http/http.dart" as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey'),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An Unexpected error occured';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }

    //print(res.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Weathet App"), centerTitle: true, actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // Add your refresh logic here
            setState(() {
              weather = getCurrentWeather();
            });
          },
        ),
      ]),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final currTemp = currentWeatherData['main']['temp'];
          final currSky = currentWeatherData['weather'][0]['main'];
          final currPressure = currentWeatherData['main']['pressure'];
          final currHumidity = currentWeatherData['main']['humidity'];
          final windSpeed = currentWeatherData['wind']['speed'];
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              //main card
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$currTemp K',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        currSky == 'Clouds' || currSky == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$currSky',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
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

              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data['list'][index + 1];
                      final hourlySky =
                          data['list'][index + 1]['weather'][0]['main'];
                      final hourlyTemp =
                          data['list'][index + 1]['main']['temp'];
                      final time = DateTime.parse(hourlyForecast['dt_txt']);

                      return weatherForecast(
                          icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                              ? Icons.cloud
                              : Icons.sunny,
                          temp: hourlyTemp.toString(),
                          time: DateFormat.Hm().format(time));
                    }),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Otherinfo(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: currHumidity.toString()),
                  Otherinfo(
                      icon: Icons.wind_power,
                      label: "Wind Speed",
                      value: windSpeed.toString()),
                  Otherinfo(
                      icon: Icons.umbrella,
                      label: "Pressure",
                      value: currPressure.toString()),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
