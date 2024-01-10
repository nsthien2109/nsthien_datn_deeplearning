import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/home/home.provider.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:provider/provider.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (_, homeState, __) {
      final data = homeState.data?.results ?? [];
      return CarouselSlider(
        carouselController: homeState.carouselController,
        options: CarouselOptions(
            onPageChanged: (index, reason) {
              Provider.of<HomeProvider>(context, listen: false)
                  .changePage(index);
            },
            height: heightP(context) / 1.9),
        items: data.map((bird) {
          return Stack(children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, '/detail', arguments: bird),
              child: Container(
                  height: heightP(context) / 2,
                  width: widthP(context),
                  margin: EdgeInsets.symmetric(
                      horizontal: sizePersen(context, 2.0)),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(sizePersen(context, 2.0)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: cacheImageNetwork(url: bird.images![0]))),
            ),
            Positioned(
                top: sizePersen(context, 4),
                right: sizePersen(context, 8),
                child: Text(
                  bird.commonName!.toUpperCase(),
                  style: TextStyle(
                      fontSize: sizeText(context, 10),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ))
          ]);
        }).toList(),
      );
    });
  }
}
