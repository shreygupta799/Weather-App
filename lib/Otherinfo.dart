import "package:flutter/material.dart";

class Otherinfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const Otherinfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
