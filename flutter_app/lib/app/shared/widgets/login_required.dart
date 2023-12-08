import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/widgets/button.dart';

class LoginRequiredPage extends StatelessWidget {
  const LoginRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [Button()],
        ),
      ),
    );
  }
}
