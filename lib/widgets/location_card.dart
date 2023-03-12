import 'package:bottom_navigation/models/models.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final Location? location;
  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Column(
            children: [
              Text(location?.name ?? ""),
              Text(location?.type ?? ""),
              Text(location?.dimension ?? ""),
            ],
          ),
        ],
      ),
    );
  }
}
