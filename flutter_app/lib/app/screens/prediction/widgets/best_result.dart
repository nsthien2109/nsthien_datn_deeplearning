import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BestResult extends StatelessWidget {
  Bird bird;
  File previewImage;
  BestResult({super.key, required this.bird, required this.previewImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Best Result for you",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.f2)),
        ),
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0, aspectRatio: 16 / 9, autoPlay: true),
              items: bird.images?.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(i, fit: BoxFit.cover)));
                  },
                );
              }).toList(),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal.withOpacity(.4)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.file(
                        previewImage,
                        fit: BoxFit.cover,
                      )),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bird.commonName ?? 'Unknow',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500)),
              Row(
                children: [
                  const Text("Confidence : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("${bird.confidence}%",
                      style: TextStyle(
                          color: bird.confidence! > 50.0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600))
                ],
              ),
              Text("Vietnamese : ${bird.vietnameseName ?? 'Unknow'}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/detail', arguments: bird),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: const Text("Show detail"))
            ],
          ),
        )
      ],
    );
  }
}
