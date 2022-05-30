import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/app_config.dart';
import '../models/httpresponse.dart';
import '../models/kiot.dart';


class KiotHelper {
  static Future<HTTPResponse<List<Kiot>>> getEmpty(int marketId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConfig.FCM_token) ?? null;
      String _apiHost = await AppConfig.choseApiHost();
      String url = _apiHost + AppConfig.kiotEmpty + marketId.toString() +"?token=" + token;

      var response = await get(url);
      if (response.statusCode == 200) {

        var body = jsonDecode(response.body);
        List<Kiot> kiot = [];
        body.forEach((e) {
          Kiot co = Kiot.fromJson(e);

          kiot.add(co);
        });
        return HTTPResponse<List<Kiot>>(
          true,
          kiot,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Kiot>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Kiot>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Kiot>>(
        false,
        null,
        message:
        'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Kiot>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}