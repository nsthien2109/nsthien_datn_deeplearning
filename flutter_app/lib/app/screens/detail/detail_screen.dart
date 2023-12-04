import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CarouselSlider(
          items: [
            Container(
              width: widthP(context),
              color: Colors.pink,
              child: Image.network(
                'https://debspark.audubon.org/sites/default/files/styles/hero_mobile/public/western_tanager_usfws.jpg?itok=30SSiFxC',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: widthP(context),
              color: Colors.pink,
              child: Image.network(
                'https://www.denverpost.com/wp-content/uploads/2016/05/20100508__20100509_B05_FE09CSCOOLOp2.jpg?w=428',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: widthP(context),
              color: Colors.pink,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBEaEwZnbHN1V5rvRc_u3RMUyBbRdoog1h2LmXl-spaMPlrcPiAZEyxUV0WcdUKelK5U&usqp=CAU',
                fit: BoxFit.cover,
              ),
            )
          ],
          options: CarouselOptions(
              height: 350,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(microseconds: 800),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal)),
    ));
  }
}
