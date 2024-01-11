import 'package:flutter/material.dart';

class BirdTypeItem extends StatelessWidget {
  dynamic data;
  BirdTypeItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Center(
            child: Text(data?.toString() ?? 'No'),
          )),
    );
    ;
  }
}
