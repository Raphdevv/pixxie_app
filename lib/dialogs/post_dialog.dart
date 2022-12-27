import 'package:flutter/material.dart';
import 'package:pixxie/constant/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.97,
      child: Scaffold(
        appBar: appBarCreatePost(context),
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
            onPressed: () {},
            child: const Text("Post"),
          ),
        )
      ],
    );
  }
}
