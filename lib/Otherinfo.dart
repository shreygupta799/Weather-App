import "package:flutter/material.dart";

class Otherinfo extends StatelessWidget {
  const Otherinfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
