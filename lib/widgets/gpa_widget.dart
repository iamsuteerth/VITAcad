import 'package:flutter/material.dart';

class GpaWidget extends StatelessWidget {
  final double gpa;
  const GpaWidget({
    super.key,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(gpa.toString()));
  }
}
