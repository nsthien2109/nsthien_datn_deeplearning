import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/history/widgets/history_list.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'History',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey[100],
              height: 1.0,
            )),
      ),
      body: const HistoryList(),
    );
  }
}
