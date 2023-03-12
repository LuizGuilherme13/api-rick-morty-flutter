import 'package:bottom_navigation/controller/controller.dart';
import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/widgets/location_card.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late FutureBuilder<List<Location>> futureLocation;

  @override
  void initState() {
    super.initState();
    futureLocation = fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      // height: MediaQuery.of(context).size.height / 1.7,
      // width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: futureLocation,
        ),
      ),
    );
  }

  FutureBuilder<List<Location>> fetchLocations() =>
      FutureBuilder<List<Location>>(
          future: controller.fetchLocations(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<Location> locations = snapshot.data ?? [];
            final bool locationCounter = locations.isNotEmpty;

            print(locations.length);
            if (locationCounter) {
              return _buildLocations(locations);
            } else {
              return Container();
            }
          });

  Widget _buildLocations(List<Location> locations) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return LocationCard(
            location: locations[index],
          );
        });
  }
}
