import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/screens/prediction/predict.provider.dart';
import 'package:njha_bird_detect/app/screens/prediction/widgets/other_result.dart';
import 'package:njha_bird_detect/app/screens/prediction/widgets/scanning.dart';
import 'package:njha_bird_detect/app/shared/widgets/button.dart';
import 'package:provider/provider.dart';
import 'widgets/best_result.dart';

class PredictResult extends StatelessWidget {
  const PredictResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PredictProvider>(builder: (context, predictState, _) {
          return predictState.isLoading
              ? const Scanning()
              : ListView(
                  children: [
                    BestResult(
                        bird: predictState.result.isNotEmpty
                            ? predictState.result[0]
                            : Bird(),
                        previewImage: predictState.imageFile!),
                    OtherResult(
                        birds: predictState.result.isNotEmpty
                            ? predictState.result
                            : []),
                  ],
                );
        }),
        bottomSheet: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.transparent,
            height: 80,
            child: Center(
                child: Button(
                    radius: 100,
                    title: "Back",
                    onTap: () => Navigator.pop(context)))));
  }
}
