import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mms_1/models/revenue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/app_config.dart';
import '../models/httpresponse.dart';



class RevenueHelper {
  Client client = Client();

    Future<HTTPResponse<List<Revenue>>> Search(int month, int year) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConfig.FCM_token) ?? null;
      int householdBusinessId = prefs.getInt('HouseholdBusinessId') ?? 0;
      int marketId = prefs.getInt(AppConfig.MarketId) ?? 0;


      final response = await client.post(
        AppConfig.URL_REVENUESEARCH +"?token=" + token,
        body: {'month': month.toString(), 'year': year.toString(), 'HouseholdBusinessId':  householdBusinessId.toString() , 'marketId': marketId.toString()},
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Revenue> revenue = [];
        body.forEach((e) {
          Revenue re = Revenue.fromJson(e);
          revenue.add(re);
        });
        return HTTPResponse<List<Revenue>>(
          true,
          revenue,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Revenue>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Revenue>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Revenue>>(
        false,
        null,
        message:
        'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Revenue>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}