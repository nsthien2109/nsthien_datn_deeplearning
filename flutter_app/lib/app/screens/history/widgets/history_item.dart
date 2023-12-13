import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class HistoryItem extends StatelessWidget {
  History history;
  HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                cacheImageNetwork(
                    height: 70,
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_I9EGuo-MBIq1puHCWjmqJP9qqs1a0WEyKA&usqp=CAU",
                    plColor: Colors.transparent),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Chim vang anh",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text("2023-11-22",
                              style: TextStyle(
                                  fontSize: 11, color: AppColors.blackGrey)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text("Confidence : 50%",
                          style: TextStyle(
                              fontSize: 12, color: AppColors.blackGrey))
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.minus_cirlce))
              ],
            )),
      ),
    );
  }
}
