import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/screens/auth/auth.provider.dart';
import 'package:njha_bird_detect/app/screens/history/widgets/history_empty.dart';
import 'package:njha_bird_detect/app/screens/history/widgets/history_list.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getHistoriesData();
    super.initState();
  }

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
      body: Consumer<AuthProvider>(builder: (context, authState, _) {
        return authState.histories!.length < 1
            ? const HistoryEmpty()
            : HistoryList(histories: authState.histories ?? []);
      }),
    );
    ;
  }
}
