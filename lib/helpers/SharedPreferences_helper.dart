import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepos {


// get data string from key
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();

    String  data = prefs.getString(key) ?? '';
    if(data == ''){

      //throw Exception('Failed to get data');
      return null;
    }
    return data;
  }

  // get data int from key
  Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();

    int data = prefs.getInt(key) ?? 0;
    if(data == 0){

      //throw Exception('Failed to get data');
      return 0;
    }
    return data;
  }
// set data string from key
  Future setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
    return true;

  }

  // set data int from key
  Future<bool> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(key, value);
    return true;

  }

}