import 'package:bottom_navigation/api/api.dart';
import 'package:bottom_navigation/models/models.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Result> futureCharacter = [];

  @override
  void initState() {
    super.initState();
    fetchCharacter().then((map) {
      futureCharacter = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: futureCharacter.length,
        itemBuilder: (context, index) {
          return Text(futureCharacter[index].name);
        },
      ),
    );
  }
}

// class MyList extends StatefulWidget {
//   final List<Result>? data;

//   const MyList({Key? key, required this.data}) : super(key: key);

//   @override
//   _MyListState createState() => _MyListState();
// }

// class _MyListState extends State<MyList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.data!.length,
//       itemBuilder: (context, index) {
//         return Center(
//           child: Text(widget.data![index].name),
//         );
//       },
//     );
//   }
// }
