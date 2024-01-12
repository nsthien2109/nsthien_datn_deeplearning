import 'package:flutter/material.dart';

class HistoryEmpty extends StatelessWidget {
  const HistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/notfound.png',
            width: 200,
          ),
        ),
        const SizedBox(height: 15),
        const Text("No History found")
      ],
    );
  }
}
