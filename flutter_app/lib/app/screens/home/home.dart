import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/home/home.provider.dart';
import 'package:njha_bird_detect/app/screens/home/widgets/home_carousel.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';
import 'package:njha_bird_detect/app/shared/widgets/choose_image_options.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Njha Birds"),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.only(top: sizePersen(context, 4)),
                child: const HomeCarousel()),
            Padding(
              padding: EdgeInsets.only(top: sizePersen(context, 1)),
              child: DotsIndicator(
                mainAxisAlignment: MainAxisAlignment.center,
                dotsCount: 10,
                position: context.watch<HomeProvider>().pageIndex,
                decorator: DotsDecorator(
                  activeColor: AppColors.primaryColor,
                  color: const Color(0xFFF5F5F5),
                  size: const Size(5.0, 3.0),
                  activeSize: const Size(15.0, 3.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(sizePersen(context, 8)),
              child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          fixedSize: Size(widthP(context), 55),
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white),
                      child: const Text("Let's Started"),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              const ChooseImageOptions()))),
            )
          ],
        )));
  }
}
