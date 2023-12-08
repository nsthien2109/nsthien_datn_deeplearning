import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Bird bird = ModalRoute.of(context)!.settings.arguments as Bird;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            bird.commonName!,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              )),
          actions: [
            IconButton(
                icon: const Icon(Icons.search, color: AppColors.blackGrey),
                onPressed: () {}),
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  CarouselSlider(
                      items: [
                        ...bird.images!.map(
                          (item) => SizedBox(
                              width: widthP(context),
                              child: cacheImageNetwork(
                                  url: item,
                                  width: widthP(context),
                                  height: 300)),
                        )
                      ],
                      options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(microseconds: 800),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal)),
                  Positioned(
                      bottom: 20,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bird.commonName!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.f2)),
                            Row(
                              children: [
                                const Text("Order Bird",
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 10),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                const SizedBox(width: 10),
                                const Text("Family Bird",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
                width: widthP(context),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Text("Vietnamese Name : ",
                        style: TextStyle(color: AppColors.blackGrey)),
                    Text(
                      "Chim chao mao",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: AppSize.f5),
                    )
                  ],
                )),
          ],
        )));
  }
}
