import 'package:api_test_new_project/model/fake_store_model.dart';
import 'package:api_test_new_project/services/fake_store_api.dart';
import 'package:flutter/material.dart';

class HomePageApi extends StatefulWidget {
  const HomePageApi({super.key});

  @override
  State<HomePageApi> createState() => _HomePageApiState();
}

class _HomePageApiState extends State<HomePageApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<FakeStrore>>(
      future: FakeStoreApi.getFakeStoreData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text('Veri geldi'),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Hata Veri Gelmedi'),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
