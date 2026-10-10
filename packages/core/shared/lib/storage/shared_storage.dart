abstract class SharedStorage {
  Future<void> init();

  Future<void> storeString(String key, String value);

  String getString(String key);

  Future<void> storeBool({required String key, required bool value});

  bool getBool(String key, {bool defaultValue = false});

  List<String> getStringList(String key);

  Future<void> storeStringList(String key, List<String> stringList);

  Future<void> storeInt({required String key, required int value});

  int? getInt(String key);

  Future<void> removeValue(String key);

  bool containsKey(String key);

  Future<void> clear();
}
