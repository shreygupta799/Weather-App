import "package:flutter/material.dart";

class weatherForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const weatherForecast({
    super.key,
    required this.icon,
    required this.temp,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            children: [
              Text(
                time,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(icon, size: 29),
              const SizedBox(
                height: 10,
              ),
              Text(temp,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
