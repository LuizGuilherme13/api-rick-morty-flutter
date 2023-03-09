import 'package:flutter/material.dart';

class NewPageScreen extends StatelessWidget {
  final String title;
  const NewPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
