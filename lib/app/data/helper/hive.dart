import 'package:hive/hive.dart';

class LangHeper {
  factory LangHeper() => _instance;
  LangHeper._internal();
  static final LangHeper _instance = LangHeper._internal();
  static Box<dynamic>? _langUrlBox;
  static Box<dynamic> get langUrlBox => _langUrlBox!;
  static Box<dynamic>? _langBox;
  static Box<dynamic> get langBox => _langBox!;

  Future<void> initHive() async {
    await Hive.openBox('langUrl');
    _langUrlBox = Hive.box('langUrl');
    await Hive.openBox('lang');
    _langBox = Hive.box('lang');
  }

  void storeUrl(List<Map<String, dynamic>> listData) {
    listData.forEach((Map<String, dynamic> element) {
      if (_langUrlBox!.keys.contains(element.keys.first)) {
        if (!_langUrlBox!.values.contains(element.values.toString())) {
          _langUrlBox!.put(element.keys.first, element.values.toString());
        }
      } else {
        _langUrlBox!.put(element.keys.first, element.values.toString());
      }
    });
  }

  void storeLang(String langCode, Map<String, dynamic> lang) {
    if (!_langBox!.containsKey(langCode)) {
      _langBox!.put(langCode, lang);
    }
  }
}
