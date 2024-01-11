import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/filter/filter.provider.dart';
import 'package:njha_bird_detect/app/screens/filter/widgets/bird_item_horizontal.dart';
import 'package:provider/provider.dart';

class FilterBirdScreen extends StatefulWidget {

  const FilterBirdScreen({super.key});

  @override
  State<FilterBirdScreen> createState() => _FilterBirdScreenState();
}

class _FilterBirdScreenState extends State<FilterBirdScreen> {

  @override
  void initState() {
    // final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    // if(data is BirdFamily) {
    //   filterProvider.getFamily(data.id!);
    // }else if(data is BirdStatus){
    //   filterProvider.getStatus(data.id!);
    // }else if(data is BirdOrder){
    //   filterProvider.getOrder(data.id!);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Consumer<FilterProvider>(
        builder: (_,state,__) {
          return ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(vertical: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const BirdItemHorizontal();
            },
          );
        }
      ),
    );
  }
}

