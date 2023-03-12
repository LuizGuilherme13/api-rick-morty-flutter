import 'package:bottom_navigation/models/models.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final CharacterDTO detail;
  final IconData? iconDetail;
  const Details({Key? key, required this.detail, this.iconDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      // color: Colors.blue,
      width: 219,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 40,
                width: 200,
                //color: Colors.amber,
                child: Text(
                  '#${detail.id} ${detail.name}',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 16,
                  ),
                  Text(
                    detail.species,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      detail.location.name,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.radar,
                    size: 16,
                  ),
                  Text(
                    detail.status,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
