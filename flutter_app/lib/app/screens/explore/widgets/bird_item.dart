import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdItem extends StatelessWidget {
  Bird bird;
  BirdItem({super.key, required this.bird});

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
          onTap: () => Navigator.pushNamed(context, '/detail', arguments: bird),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: cacheImageNetwork(
                    width: boxImageSize,
                    height: boxImageSize,
                    url: bird.images![0]),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(
                  bird.commonName!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
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
