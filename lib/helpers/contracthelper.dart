import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/app_config.dart';
import '../models/contract.dart';
import '../models/httpresponse.dart';


class ContractHelper {


  static Future<HTTPResponse<List<Contract>>> search() async {
    try {
      // String url = AppConfig.kiotForRentSearch;
      // var response = await get(url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConfig.FCM_token) ?? null;
      String rentCode = prefs.getString(AppConfig.RentCode) ?? 'null';
      Client client = Client();
      final response = await client.post(
        AppConfig.kiotForRentGetByRentCode +"?token=" + token,
        body: {'rentCode': rentCode},
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Contract> contracts = [];
        body.forEach((e) {
          Contract contract = Contract.fromJson(e);
          contracts.add(contract);
        });
        return HTTPResponse<List<Contract>>(
          true,
          contracts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Contract>>(
          false,
          null,
          message:
          'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Contract>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Contract>>(
        false,
        null,
        message:
        'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Contract>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}