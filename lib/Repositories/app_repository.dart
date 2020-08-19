import 'package:gym/Repositories/repository.dart';
import 'package:gym/models/appData.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppRepository extends Repository {

  Future<AppData> loadAppData() async {
    var token = await getToken();
    bool isSeenOnboard = await hasOnboardingSeen();

    return AppData(token, isSeenOnboard);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

  Future setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<bool> hasOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seentutorial') ?? false;
  }

  Future<void> persistOnboarding(bool seentutorial) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('seentutorial', seentutorial);
    return;
  }
}
