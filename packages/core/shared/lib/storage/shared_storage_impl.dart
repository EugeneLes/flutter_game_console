import 'package:shared/storage/shared_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A simple wrapper around SharedPreferences to be able to create it synchronously
/// SharedPreferences.getInstance() is an async method, so this class hides it
/// to make it easier to use with GetIt.
/// Also makes it easier to use custom prefs storage logic later if we need it.
class SharedStorageImpl extends SharedStorage {
  late SharedPreferences _instance;

  @override
  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  @override
  Future<void> storeString(String key, String value) async {
    await _instance.setString(key, value);
  }

  @override
  String getString(String key) {
    return _instance.getString(key) ?? '';
  }

  @override
  Future<void> storeBool({required String key, required bool value}) async {
    await _instance.setBool(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _instance.getBool(key) ?? defaultValue;
  }

  @override
  List<String> getStringList(String key) {
    return _instance.getStringList(key) ?? [];
  }

  @override
  Future<void> storeStringList(String key, List<String> stringList) async {
    await _instance.setStringList(key, stringList);
  }

  @override
  Future<void> storeInt({required String key, required int value}) async {
    await _instance.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _instance.getInt(key);
  }

  @override
  Future<void> removeValue(String key) async {
    await _instance.remove(key);
  }

  @override
  bool containsKey(String key) {
    return _instance.containsKey(key);
  }

  @override
  Future<void> clear() async {
    await _instance.clear();
  }
}
