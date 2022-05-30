import 'dart:convert';

import 'package:http/http.dart';
import '../models/householdBusiness.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/app_config.dart';

class AuthRepos {
  Client client = Client();


  Future<bool> signIn(String name, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String token = prefs.getString(AppConfig.FCM_token) ?? 'null';
    String _apiHost = await AppConfig.choseApiHost();

    final response = await client.post(
      _apiHost + AppConfig.URL_SIGNIN,
      body: {'name': name, 'pass': pass},
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {

      if (mapResponse["isSuccess"] == true) {
        prefs.setInt('HouseholdBusinessId', mapResponse["HouseholdBusinessId"]);
        // print( mapResponse["HouseholdBusinessId"]);
        prefs.setString('HouseholdBusinessName', mapResponse["HouseholdBusinessName"]);
        prefs.setString('RentCode', mapResponse["RentCode"]);
        prefs.setInt('KiotForRentID', mapResponse["KiotForRentID"]);
        prefs.setInt('MarketID', mapResponse["MarketID"]);
        prefs.setString('LOGIN','YES');
        prefs.setString(AppConfig.FCM_token, mapResponse["token"]);
        print('SignIn:  Success to sign in');
        // print(mapResponse["token"]);
        return true;
      }
      print('SignIn:  Faile to sign in');
      prefs.setString('LOGIN','NO');
      return false;
    }

    print('Connect-SignIn:  Failed to get data');
    return false;
  }

  Future<bool> checkIsAuthenticated () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String _auth = prefs.getString('LOGIN') ?? 'NO';
    String token = prefs.getString(AppConfig.FCM_token) ?? null;
    String _apiHost = await AppConfig.choseApiHost();

    if (token != null) {
      final response = await client.get(_apiHost + AppConfig.URL_VERIFY +"?token=" + token);
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        if (mapResponse["isSuccess"] == true) {
          return true;
        }
        signOut();
        return false;
      }
      return false;
    }
    return false;

  }

  Future<bool> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //String token = prefs.getString(FCM_token)??'null';
    prefs.remove('HouseholdBusinessId');
    prefs.remove('HouseholdBusinessName');
    prefs.remove('KiotForRentID');
    prefs.remove('MarketID');
    prefs.remove('EmployeeID');
    prefs.remove('LOGIN');
    prefs.remove(AppConfig.FCM_token);
    return true;
  }

  Future<bool> changePassword(String rePass, String pass) async {


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConfig.FCM_token)??null;
    String _apiHost = await AppConfig.choseApiHost();

    final response = await client.post(
      _apiHost + AppConfig.URL_CHANGEPASSWORD,
      body: {'rePassWord': rePass, 'pass': pass, 'token': token},
    );

    Map<String, dynamic> mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      if (mapResponse["isSuccess"] == true) {
        print('changePassword:  Success');
        return true;
      }
      print('changePassword:  Faile');
      return false;
    }

    print('Connect:  Failed');
    return false;

  }


  Future<HouseholdBusiness> getHouseholdBusinessInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConfig.FCM_token)??null;
    int householdBusinessId = prefs.getInt('HouseholdBusinessId') ?? 0;
    String _apiHost = await AppConfig.choseApiHost();

    final response =
    await client.get(_apiHost + AppConfig.URL_GETINFOHOUSEHOLDBUSINESS+ householdBusinessId.toString() +"?token=" + token);
    if (response.statusCode == 200) {
      //throw Exception('Failed to load TestAssignment');
      return HouseholdBusiness.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load TestAssignment');
      //return null;
    }
  }




  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString(AppConfig.FCM_token).toString();
    return _token;
  }
}