import 'package:bottom_navigation/controller/controller.dart';
import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/widgets/character_card.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  int page = 1;

  CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreen();
}

class _CharacterScreen extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(4)),
            child: Text(
              'Page ${widget.page}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          height: MediaQuery.of(context).size.height / 1.7,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: fetchCharacters(widget.page),
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
                    });
                  },
                  child: const Icon(Icons.arrow_left)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.page++;
                    });
                  },
                  child: const Icon(Icons.arrow_right)),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<CharacterDTO>> fetchCharacters(int page) =>
      FutureBuilder<List<CharacterDTO>>(
          future: controller.fetchCharacters(page),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;

            if (characterCounter) {
              return _buildCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildCharacters(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: characters[index]);
        });
  }
}
