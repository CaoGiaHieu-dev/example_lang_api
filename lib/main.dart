import 'package:example_lang_api/app/data/helper/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/data/provider/lang.dart';
import 'app/routes/app_pages.dart';

Future<void> storeUrl() async {
  Map<String, dynamic> totalUrl = await (Lang().getTotalLang());
  List<Map<String, dynamic>> listUrlLang = [];
  (totalUrl['rows'] as List<dynamic>).forEach((element) {
    listUrlLang.add({"${element['lang_code']}": "${element['file_url']}"});
  });
  LangHeper().storeUrl(listUrlLang);
}

void getAllLang() {
  LangHeper.langUrlBox.toMap().forEach((key, value) async {
    Map<String, dynamic> getLang = await (Lang().getLang(key));
    LangHeper().storeLang(key, getLang);
  });
}

ValueNotifier<String> lang = ValueNotifier<String>('');
Map<dynamic, dynamic> get currentLang {
  return LangHeper.langBox.toMap()[lang.value] ?? Map<dynamic, dynamic>();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //init box
  await LangHeper().initHive();
  await storeUrl();
  getAllLang();
  //get all url lang
  runApp(
    ValueListenableBuilder(
      builder: (BuildContext context, value, _) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
      valueListenable: lang,
    ),
  );
}
