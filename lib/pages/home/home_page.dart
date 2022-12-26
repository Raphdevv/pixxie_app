import 'package:flutter/material.dart';
import 'package:pixxie/pages/home/home_page_feed.dart';

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
            labelColor: Color(0xFFFA4990),
            indicatorColor: Color(0xFF00C0B0),
            unselectedLabelColor: Color(0xFF1A1A1A),
            tabs: [
              Tab(
                text: "Feed",
              ),
              Tab(
                text: "Artist",
              ),
              Tab(
                text: "Live",
              ),
              Tab(
                text: "Musical",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: HomePageFeed(),
            ),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        ),
      ),
    );
  }
}
