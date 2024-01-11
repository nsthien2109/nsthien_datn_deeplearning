import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdItemHorizontal extends StatelessWidget {
  Bird bird;
  BirdItemHorizontal({super.key, required this.bird});

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

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(bird.commonName ?? 'Unknown',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                )),
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child:  Row(
                              children: [
                                const Icon(Iconsax.location,
                                    color: AppColors.blackGrey, size: 12),
                                const SizedBox(width: 5),
                                Text(bird.status?.statusName ?? '',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.blackGrey
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child:  Row(
                              children: [
                                const Icon(Iconsax.card,
                                    color: AppColors.blackGrey, size: 12),
                                const SizedBox(width: 5),
                                Text(bird.vietnameseName ?? 'Unknown',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.blackGrey
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(bird.scientificName ?? 'Unknown' ,
                                style:const  TextStyle(
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


