import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/screens/history/widgets/history_item.dart';

class HistoryList extends StatelessWidget {
  List<History> histories;
  HistoryList({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: histories.length,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return HistoryItem(history: histories[index]);
        });
  }
}
