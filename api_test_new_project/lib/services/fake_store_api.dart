import 'dart:convert';

import 'package:api_test_new_project/model/fake_store_model.dart';
import 'package:dio/dio.dart';

class FakeStoreApi {
  static const String url = 'https://fakestoreapi.com/products'; //https://fakestoreapi.com/products
  static Future<List<FakeStrore>> getFakeStoreData() async {
    List<FakeStrore>? list = [];
    var result = await Dio().get(url);
    var fakeApiList = jsonDecode(result.data); // Get

    if (fakeApiList is List) {
      list = fakeApiList
          .map((e) => FakeStrore.fromJson(e))
          .cast<FakeStrore>()
          .toList();
    } else {
      return [];
    }
    return list;
  }
}
