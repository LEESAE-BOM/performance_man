import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static final storage = new FlutterSecureStorage();
  String? value;

  Future<void> readValue(key) async{
    value = await storage.read(key: key);
  }

  Future<void> writeValue(key, value) async{
    await storage.write(key: key, value: value);
  }

  Future<void> deleteValue(key) async{
    await storage.delete(key: key);
  }
}

SessionManager loginSession = SessionManager();