import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Scanning extends StatelessWidget {
  const Scanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/images/scanning.json'),
        Text("Loading...")
      ],
    );
  }
}
