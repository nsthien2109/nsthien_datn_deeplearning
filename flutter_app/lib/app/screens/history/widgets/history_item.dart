import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/shared/utils/cache_image.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class HistoryItem extends StatelessWidget {
  History history;
  HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(history.date ?? '2023-01-01 12:00:00');

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
                    width: 70,
                    url: history.url,
                    plColor: Colors.transparent),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                                history.predictions!.isNotEmpty
                                    ? history.predictions![0].bird!.commonName!
                                    : "Unknow",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(DateFormat.yMd().format(dateTime),
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.blackGrey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                          "Confidence : ${history.predictions!.isNotEmpty ? history.predictions![0].confidence : 0}%",
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.blackGrey))
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.minus_cirlce))
              ],
            )),
      ),
    );
  }
}
