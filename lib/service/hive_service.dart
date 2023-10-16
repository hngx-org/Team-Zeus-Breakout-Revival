import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final Box _box = Hive.box('data');

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  dynamic getData(String key) {
    return _box.get(key);
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  Future<void> clearData() async {
    await _box.clear();
  }

  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  int getLength() {
    return _box.length;
  }

  List<dynamic> getAllValues() {
    return _box.values.toList();
  }
}
