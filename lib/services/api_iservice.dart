import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
}
