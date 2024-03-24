import 'package:flutter/material.dart';

class Semester extends StatelessWidget {
  final String year;
  const Semester({super.key,required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(year.length.toString()),),
    );
  }
}
