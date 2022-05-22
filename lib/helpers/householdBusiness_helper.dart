import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../configs/app_config.dart';
import '../models/householdBusiness.dart';
import '../models/httpresponse.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HouseholdBusinessHelper {
  static Future<HTTPResponse<List<HouseholdBusiness>>> getAll() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConfig.FCM_token) ?? null;
      String url = AppConfig.householdBusinessGetall +"?token=" + token;
      var response = await get(url);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<HouseholdBusiness> householdBusiness = [];
        body.forEach((e) {
          HouseholdBusiness co = HouseholdBusiness.fromJson(e);
          householdBusiness.add(co);
        });
        return HTTPResponse<List<HouseholdBusiness>>(
          true,
          householdBusiness,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<HouseholdBusiness>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<HouseholdBusiness>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<HouseholdBusiness>>(
        false,
        null,
        message:
        'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<HouseholdBusiness>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}