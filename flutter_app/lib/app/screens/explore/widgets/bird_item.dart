import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdItem extends StatelessWidget {
  Bird bird;
  double? confidence;
  BirdItem({super.key, required this.bird, this.confidence});

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (widthP(context) - 24) / 2 - 12;
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pushNamed(context, '/detail', arguments: bird),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: cacheImageNetwork(
                    width: boxImageSize,
                    height: boxImageSize,
                    url: bird.images!.isNotEmpty
                        ? bird.images![0]
                        : 'https://jmva.or.jp/wp-content/uploads/2018/07/noimage.png'),
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
                child: Text(
                    "${confidence != null ? "Confidence : ${confidence}%" : bird.className}",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    const Icon(Iconsax.location, size: 12),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(bird.vietnameseName ?? 'Unknow',
                          style: const TextStyle(
                              fontSize: 11, overflow: TextOverflow.ellipsis)),
                    )
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
