import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pixxie/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class APiservice {
  final _dio = Dio();
  final BehaviorSubject<List<PostModel>> _getallPost =
      BehaviorSubject<List<PostModel>>();
  BehaviorSubject<List<PostModel>> get allPost => _getallPost;

  getallPost() async {
    List<PostModel> post = [];
    _getallPost.value = [];
    try {
      var response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      // print(response.data.toString());
      if (response.statusCode == 200) {
        post =
            response.data.map<PostModel>((e) => PostModel.fromJson(e)).toList();
        print("${post.where((element) => element.id == 101).toList()}");
        _getallPost.sink.add(post);
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
  }

  addpost(String text) async {
    try {
      var response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'userId': 1,
          'title': "มาเบลเอง",
          'body': text,
        },
      );
      print(response);
      if (response.statusCode == 201) {
        if (kDebugMode) {
          print("Add Post !");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
  }

  // bluttooth() async {
  //   var status = await Permission.bluetoothConnect.status;
  //   if (status.isDenied) {
  //     print('if');
  //     Permission.bluetoothConnect.request();
  //   } else {
  //     print('else');
  //     FlutterBluetoothSerial.instance
  //         .getBondedDevices()
  //         .then((List<BluetoothDevice> bondedDevices) {
  //       print('ddddd ${bondedDevices}');
  //     });
  //   }
  // }
}
