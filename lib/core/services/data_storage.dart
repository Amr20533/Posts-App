import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataStorage {

  DataStorage._privateConstructor();
  static final DataStorage instance = DataStorage._privateConstructor();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String keyAuthToken = 'a-u-t-h-t-o-k-e-n';
  static const String keyUserId = 'u-s-e-r-i-d';

  Future<void> writeData(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw Exception('Secure Storage Write Error: $e');
    }
  }

  Future<String?> readData(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw Exception('Secure Storage Read Error: $e');
    }
  }

  Future<void> deleteData(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw Exception('Secure Storage Delete Error: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception('Secure Storage Clear Error: $e');
    }
  }

  Future<bool> hasKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      return false;
    }
  }
}