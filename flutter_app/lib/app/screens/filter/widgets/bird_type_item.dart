import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/models/bird_status.dart';
import 'package:njha_bird_detect/app/screens/filter/filter_bird_screen.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class BirdTypeItem extends StatelessWidget {
  dynamic data;
  BirdTypeItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    String nameRender () {
      if(data is BirdOrder){
        return data?.orderName ?? 'Unknown';
      }
      if(data is BirdFamily){
        return data?.familyName ?? 'Unknown';
      }
      if(data is BirdStatus){
        return data?.statusName ?? 'Unknown';
      }
      return 'Not instance of any type';
    }

    String vietnameseNameRender () {
      if(data is BirdOrder){
        return data?.orderVietnameseName ?? 'Unknown';
      }
      if(data is BirdFamily){
        return data?.familyVietnameseName ?? 'Unknown';
      }
      if(data is BirdStatus){
        return data?.statusVietnameseName ?? 'Unknown';
      }
      return 'Not instance of any type';
    }

    String title () {
      if(data is BirdOrder){
        return "Bird Orders";
      }
      if(data is BirdFamily){
        return "Bird Families";
      }
      if(data is BirdStatus){
        return "Bird Status";
      }
      return 'Details';
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FilterBirdScreen(title : title(),data: data)),
      ),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(nameRender(), style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              Center(
                child: Text(vietnameseNameRender(), style: const TextStyle(fontSize: AppSize.f7), overflow:  TextOverflow.ellipsis,),
              ),
            ],
          )),
    );
    ;
  }
}
