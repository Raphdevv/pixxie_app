import 'package:flutter/material.dart';

class HomePageFeed extends StatefulWidget {
  const HomePageFeed({super.key});

  @override
  State<HomePageFeed> createState() => _HomePageFeedState();
}

class _HomePageFeedState extends State<HomePageFeed> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.white,
              //     blurRadius: 1,
              //     spreadRadius: 0.5,
              //     offset: Offset(1, 1),
              //   )
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/logo/ic_pixxie.png'),
                    ),
                    title: const Text("mmabelz"),
                    subtitle: const Text("26/12/2022 15:51 น."),
                    trailing: const Icon(Icons.more_horiz),
                  ),
                  const Text("สวัสดีค้า"),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("10k"),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          const Icon(
                            Icons.favorite_border_rounded,
                            color: Color(0xFFFA4990),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Row(
                        children: [
                          const Text(
                            "10k",
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          const Icon(
                            Icons.insert_comment_outlined,
                            color: Color(0xFF00C0B0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
