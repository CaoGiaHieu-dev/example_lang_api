import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../controllers/second_page_controller.dart';

class SecondPageView extends GetView<SecondPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'SecondPageView is working',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
              onPressed: () {
                lang.value = 'gb';
              },
              child: Text('EN'),
            ),
            MaterialButton(
              onPressed: () {
                lang.value = 'vn';
              },
              child: Text('VN'),
            )
          ],
        ),
      ),
    );
  }
}
