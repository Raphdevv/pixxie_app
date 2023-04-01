import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../constant/colors.dart';
import '../../dialogs/post_dialog.dart';

class MusicalPage extends StatefulWidget {
  final bool checkAvailability;
  const MusicalPage({super.key, this.checkAvailability = false});

  @override
  State<MusicalPage> createState() => _MusicalPageState();
}

class _MusicalPageState extends State<MusicalPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: height * 0.48,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 1,
                      color: Colors.white38,
                      offset: Offset(1, 2),
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/album.jpg',
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            background: Image.asset(
              'assets/images/album_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 20,
          (context, index) {
            return Card(
              child: ListTile(
                title: const Text("เด็ด"),
                subtitle: const Text("3.32 นาที"),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
              ),
            );
          },
        ))
      ],
    );
  }
}
