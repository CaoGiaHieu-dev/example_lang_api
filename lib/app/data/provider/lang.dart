import 'dart:io';

import 'package:dio/dio.dart';

class Lang {
  Future<dynamic> getTotalLang() async {
    try {
      Response<dynamic>? response = await Dio().get(
        'https://betavision-api.busodevelopers.com/v1/setting/language',
        options: Options(
          headers: {
            "appplatform": Platform.isAndroid ? 'Android' : 'iOS',
            "apppversion": "1.0.0",
            "appdeviceid": "test_id",
            "appplocale": Platform.localeName.split('_').first
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLang(String langCode) async {
    try {
      Response<dynamic>? response = await Dio().get(
        'https://betavision-s3media.busodevelopers.com/files/language/$langCode.json',
        options: Options(
          headers: {
            "appplatform": Platform.isAndroid ? 'Android' : 'iOS',
            "apppversion": "1.0.0",
            "appdeviceid": "test_id",
            "appplocale": Platform.localeName.split('_').first
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
