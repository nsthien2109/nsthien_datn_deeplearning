import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/filter.provider.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_item_horizontal.dart';
import 'package:provider/provider.dart';

import '../../models/bird_family.dart';
import '../../models/bird_order.dart';
import '../../models/bird_status.dart';

class FilterBirdScreen extends StatefulWidget {
  String title;
  dynamic data;
  FilterBirdScreen({super.key, required this.data, required this.title});

  @override
  State<FilterBirdScreen> createState() => _FilterBirdScreenState();
}

class _FilterBirdScreenState extends State<FilterBirdScreen> {

  @override
  void initState() {
    final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    if(widget.data is BirdFamily) {
      filterProvider.getFamily(widget.data.id!);
    }else if(widget.data is BirdStatus){
      filterProvider.getStatus(widget.data.id!);
    }else if(widget.data is BirdOrder){
      filterProvider.getOrder(widget.data.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<FilterProvider>(
        builder: (_,state,__) {
          listData () {
            if(widget.data is BirdFamily) {
              return state.birdFamily?.birds ?? [];
            }else if(widget.data is BirdStatus){
              return state.statusDetail?.birds ?? [];
            }else if(widget.data is BirdOrder){
              return state.orderDetail?.birds ?? [];
            }
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: listData()?.length ?? 0,
              padding: const EdgeInsets.symmetric(vertical: 0),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BirdItemHorizontal(bird: listData()![index]);
              },
            ),
          );
        }
      ),
    );
  }
}

