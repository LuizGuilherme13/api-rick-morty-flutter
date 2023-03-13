import 'package:bottom_navigation/controller/controller.dart';
import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/widgets/episode_card.dart';
import 'package:flutter/material.dart';

class EpisodeScreen extends StatefulWidget {
  int page = 1;
  EpisodeScreen({Key? key}) : super(key: key);

  @override
  _EpisodeScreenState createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  String? query = '/episode/?page=1';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: fetchEpisodes(query: query),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.page--;
                      query = '/episode/?page=${widget.page}';
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
                      query = '/episode/?page=${widget.page}';
                    });
                  },
                  child: const Icon(Icons.arrow_right)),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<EpisodeDTO>> fetchEpisodes({String? query}) =>
      FutureBuilder<List<EpisodeDTO>>(
          future: controller.fetchEpisodes(query: query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<EpisodeDTO> episodes = snapshot.data ?? [];

            if (episodes.isNotEmpty) {
              return _buildEpisodes(episodes);
            } else {
              return Container();
            }
          });

  Widget _buildEpisodes(List<EpisodeDTO> episodes) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return EpisodeCard(episode: episodes[index]);
      },
    );
  }
}
