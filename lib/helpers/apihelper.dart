import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../configs/app_config.dart';
import '../models/httpresponse.dart';
import '../models/market.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIHelper {
  static Future<HTTPResponse<List<Market>>> getAll() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConfig.FCM_token) ?? null;
      String _apiHost = await AppConfig.choseApiHost();
      String url = _apiHost + AppConfig.marketGetAll +"?token=" + token;

      var response = await get(url);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Market> markets = [];
        body.forEach((e) {
          Market market = Market.fromJson(e);
          markets.add(market);

        });
        return HTTPResponse<List<Market>>(
          true,
          markets,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Market>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Market>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Market>>(
        false,
        null,
        message:
        'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Market>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }

  static Future setDistrict(int id) async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(AppConfig.districtId, id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }
}