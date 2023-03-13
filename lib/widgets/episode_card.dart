import 'package:bottom_navigation/models/models.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatefulWidget {
  final EpisodeDTO episode;

  EpisodeCard({Key? key, required this.episode}) : super(key: key);

  @override
  _EpisodeCardState createState() => _EpisodeCardState();
}

class _EpisodeCardState extends State<EpisodeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
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
            children: [
              SizedBox(
                height: 100,
                width: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/rick_and_morty.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('${widget.episode.episode} |',
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Episódio ${widget.episode.id}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.episode.airDate,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
