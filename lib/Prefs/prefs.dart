import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveLocalMessageUser(String message) {
    _prefs.setString('user', message);
  }

  static void saveLocalMessageAdmin(String message) {
    _prefs.setString('admin', message);
  }

  static void saveLocalListMessage(List<String> list,
      {String user = "", String admin = "", String lazyLoading = ""}) {
    if (user != "") {
      Prefs.saveLocalMessageUser(user);
      list.add(getLocalMessageUser());
    }
    if (admin != "") {
      Prefs.saveLocalMessageAdmin(admin);
      list.add(getLocalMessageAdmin());
    }
    if (lazyLoading != "") {
      list.add("lazyLoading");
    }
    _prefs.setStringList('list', list);
  }

  static String getLocalMessageUser() {
    return _prefs.getString("user") ?? "N/A";
  }

  static String getLocalMessageAdmin() {
    return _prefs.getString("admin") ?? "N/A";
  }

  static List<String> getLocalListMessage() {
    return _prefs.getStringList("list") ?? [];
  }

  static void removeLazyLoading(List<String> list) {
    list.removeWhere((e) => e == "lazyLoading");
    _prefs.setStringList('list', list);
  }

  static void removeAllMessage() {
    _prefs.remove("list");
    _prefs.remove("user");
    _prefs.remove("admin");
  }
}
