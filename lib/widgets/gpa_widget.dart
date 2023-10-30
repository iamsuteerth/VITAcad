import 'package:flutter/material.dart';

class GpaWidget extends StatelessWidget {
  final double gpa;
  const GpaWidget({
    super.key,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  gpa != 0 ? gpa.toString() : ': )',
                  style: const TextStyle(fontFamily: 'MrsEaves', fontSize: 28),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
