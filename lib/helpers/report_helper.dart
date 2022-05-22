import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configs/app_config.dart';

class ReportRepos {
  Client client = Client();


  Future<bool> sendReport(int typeId, String title, String content, String address, String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConfig.FCM_token) ?? null;
    int householdBusinessId = prefs.getInt('HouseholdBusinessId') ?? 0;
    int marketId = prefs.getInt('MarketID') ?? 0;

    final response = await client.post(
      AppConfig.URL_SENDREPORT +"?token=" + token,
      body: {'typeId': typeId.toString(),'marketId': marketId.toString() ,'title': title, 'content': content, 'address': address, 'mobile': mobile,'HouseholdBusinessId':  householdBusinessId.toString() },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {

      if (mapResponse["isSuccess"] == true) {
        return true;
      }
      return false;
    }

    print('Connect-Report:  Failed to get data');
    return false;
  }


}