import 'package:flutter/material.dart';
import 'package:pixxie/constant/colors.dart';
import 'package:pixxie/pages/home/home_page.dart';
import 'package:pixxie/pages/main_page.dart';

import '../services/api_iservice.dart';

class DialogTypePost {
  final BuildContext context;
  DialogTypePost(this.context);
  open() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) {
        return const PostDialog();
      },
    );
  }
}

class PostDialog extends StatefulWidget {
  const PostDialog({super.key});

  @override
  State<PostDialog> createState() => _PostDialogState();
}

class _PostDialogState extends State<PostDialog> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 0.9,
        child: Scaffold(
          appBar: appBarCreatePost(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                profileUser(),
                fieldTyping(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding fieldTyping() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: const TextStyle(
          color: ColorsConst.primaryColor_1,
          fontSize: 22.0,
        ),
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "What's on your mind?",
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: (value) {
          setState(() {
            text = value;
          });
        },
      ),
    );
  }

  Container profileUser() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/6.jpg'),
        ),
        title: const Text("mmabelz"),
        subtitle: Row(
          children: [
            SizedBox(
              height: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsConst.primaryColor_3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text("Feeling"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarCreatePost(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Create Post",
        style: TextStyle(
          color: ColorsConst.primaryColor_1,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.cancel,
          color: ColorsConst.primaryColor_4,
          size: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConst.primaryColor_2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              if (text != null) {
                APiservice().addpost(text!);
                Navigator.of(context).pop();
              }
            },
            child: const Text("Post"),
          ),
        )
      ],
    );
  }
}
