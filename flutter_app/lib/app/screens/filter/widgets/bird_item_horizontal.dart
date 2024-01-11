import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdItemHorizontal extends StatelessWidget {
  const BirdItemHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
          },
          child: Card(
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4)),
                        child: cacheImageNetwork(width: 80, height: 80, url: "https://cdnmedia.baotintuc.vn/Upload/YZmStSDTjb0M07hFJ2gA/files/2023/03/02/Dusky-Tetraka-020323.jpg")),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ten con chim",
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.blackColor
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text('ABCDXYZ',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Row(
                              children: [
                                Icon(Iconsax.location,
                                    color: AppColors.blackGrey, size: 12),
                                Text('Yamate',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.blackGrey
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text('Sale',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.blackGrey
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


