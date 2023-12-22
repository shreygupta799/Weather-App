import "package:flutter/material.dart";

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
