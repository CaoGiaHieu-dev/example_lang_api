import 'package:example_lang_api/app/routes/app_pages.dart';
import 'package:example_lang_api/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$currentLang',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
              onPressed: () => Get.toNamed(Routes.SECOND_PAGE),
              child: Text('second page'),
            )
          ],
        ),
      ),
    );
  }
}
