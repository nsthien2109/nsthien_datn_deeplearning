import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdItem extends StatelessWidget {
  const BirdItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (widthP(context) - 24) / 2 - 12;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pushNamed(context, '/detail'),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: cacheImageNetwork(
                    width: boxImageSize,
                    height: boxImageSize,
                    url:
                        "https://i.gadgets360cdn.com/large/kingfisher_pixabay_1482398008037.jpg"),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Chim vanh khuyen",
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Allooo",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    Text('Haha', style: TextStyle(fontSize: 11))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Row(
                  children: [
                    Icon(Iconsax.location, size: 12),
                    Text('Nam My', style: TextStyle(fontSize: 11))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
