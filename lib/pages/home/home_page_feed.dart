import 'package:flutter/material.dart';
import 'package:pixxie/dialogs/post_dialog.dart';
import 'package:pixxie/models/post_model.dart';

import '../../constant/colors.dart';
import '../../services/api_iservice.dart';

class HomePageFeed extends StatefulWidget {
  const HomePageFeed({super.key});

  @override
  State<HomePageFeed> createState() => _HomePageFeedState();
}

class _HomePageFeedState extends State<HomePageFeed> {
  late APiservice _apiService;

  List a = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
  ];

  @override
  void initState() {
    _apiService = APiservice();
    _apiService.getallPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: _apiService.allPost,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: ColorsConst.primaryColor_2,
            onRefresh: () {
              return _apiService.getallPost();
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: height * 0.07,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: ColorsConst.primaryColor_4,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(
                          color: ColorsConst.primaryColor_4,
                        ),
                      ),
                      onPressed: () {
                        DialogTypePost(context).open();
                      },
                      child: const Text(
                        "What's on your mind?",
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/1.jpg',
                        height: 500,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: snapshot.data!.length,
                    (context, index) {
                      var postData = snapshot.data![index];
                      return postList(height, width, index, postData, context);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: ColorsConst.primaryColor_4),
        );
      },
    );
  }

  Padding postList(double height, double width, int index, PostModel postData,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.02,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 1,
                color: index % 2 == 0
                    ? const Color.fromARGB(255, 224, 254, 252)
                    : const Color.fromARGB(255, 255, 223, 236),
                offset: const Offset(1, 2),
              )
            ]),
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
                title: Text(a[postData.userId - 1]),
                subtitle: const Text("26/12/2022 15:51 น."),
                trailing: const Icon(Icons.more_horiz),
              ),
              Text(
                postData.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 2,
                color: ColorsConst.primaryColor_2,
              ),
              Text(
                postData.body,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        content: index % 2 == 0
                            ? Image.asset(
                                'assets/images/1.jpg',
                                height: height * 0.9,
                                width: width * 0.9,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/2.jpg',
                                height: height * 0.9,
                                width: width * 0.9,
                                fit: BoxFit.cover,
                              ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: index % 2 == 0
                      ? Image.asset(
                          'assets/images/1.jpg',
                          height: 300,
                          width: 500,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/2.jpg',
                          height: 300,
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
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
                        color: ColorsConst.primaryColor_4,
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
                        color: ColorsConst.primaryColor_3,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
