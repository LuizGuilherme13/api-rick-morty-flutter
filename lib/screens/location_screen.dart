import 'package:bottom_navigation/controller/controller.dart';
import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/widgets/location_card.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  int page = 1;
  LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? query = '/location/?page=1';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Search by name',
          ),
          onSubmitted: (value) {
            query = '/location/?name=$value';
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: fetchLocations(query: query),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.page--;
                      query = '/location/?page=${widget.page}';
                    });
                  },
                  child: const Icon(Icons.arrow_left)),
              Container(
                alignment: AlignmentDirectional.center,
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'Page ${widget.page}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.page++;
                      query = '/location/?page=${widget.page}';
                    });
                  },
                  child: const Icon(Icons.arrow_right)),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<Location>> fetchLocations({String? query}) =>
      FutureBuilder<List<Location>>(
          future: controller.fetchLocations(query: query),
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
