import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/widgets/details.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterDTO? character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(children: [
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
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  character?.image ?? " ",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Details(
              detail: character!,
            )
          ],
        )
      ]),
    );
  }
}
