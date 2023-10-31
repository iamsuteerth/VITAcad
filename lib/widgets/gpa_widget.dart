import 'package:flutter/material.dart';

class GpaWidget extends StatelessWidget {
  final double gpa;
  const GpaWidget({
    super.key,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        child: gpa == 0
            ? null
            : Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: screenSize.width * 0.28,
                  height: screenSize.height * 0.07,
                  child: Center(
                    child: Text(
                      gpa.toString(),
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
