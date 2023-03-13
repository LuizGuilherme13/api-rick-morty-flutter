import 'package:bottom_navigation/models/models.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final Location? location;

  LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
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
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/location.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 8),
                  // color: Colors.blue,
                  width: 195,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.not_listed_location_sharp),
                          SizedBox(
                            height: 20,
                            width: 150,
                            // color: Colors.amber,
                            child: Text(
                              widget.location!.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.query_stats_rounded),
                          SizedBox(
                            height: 20,
                            width: 150,
                            child: Text(
                              widget.location!.type,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.radar),
                          SizedBox(
                            height: 20,
                            width: 150,
                            child: Text(
                              widget.location!.dimension,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
