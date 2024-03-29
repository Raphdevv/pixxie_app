import 'package:flutter/material.dart';
import 'package:pixxie/pages/home/home_page_feed.dart';
import 'package:pixxie/pages/musical/musical_page.dart';

import '../../constant/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/logo/ic_pixxie.png',
            width: 100,
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: ColorsConst.primaryColor_4,
            indicatorColor: ColorsConst.primaryColor_3,
            unselectedLabelColor: ColorsConst.primaryColor_1,
            tabs: [
              Tab(
                text: "ฟีด",
              ),
              Tab(text: "ศิลปิน"),
              Tab(
                text: "ไลฟ์",
              ),
              Tab(
                text: "เพลง",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomePageFeed(),
            Text('2'),
            Text('3'),
            MusicalPage(),
          ],
        ),
      ),
    );
  }
}
