import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/auth/onboarding_page.dart';
import 'modules/auth/selectDistrict_page.dart';
import 'modules/home_page.dart';
import 'provider/contract_provider.dart';
import 'provider/householdBusiness_provider.dart';
import 'provider/revenue_provider.dart';
import 'package:provider/provider.dart';
import 'provider/market_provider.dart';
import 'modules/auth/account_page.dart';
import 'modules/auth/login_page.dart';
import 'configs/themes/app_colors.dart';
import 'modules/revenue/revenueList_page.dart';
import 'modules/setting_page.dart';
import 'modules/splashScreen_page.dart';
import 'provider/kiot_provider.dart';
import 'provider/master_provider.dart';

void main() {

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text(
          'Something went wrong!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  };

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MarketProvider()),
        ChangeNotifierProvider(create: (_) => ContractProvider()),
        ChangeNotifierProvider(create: (_) => HouseholdBusinessProvider()),
        ChangeNotifierProvider(create: (_) => KiotProvider()),
        ChangeNotifierProvider(create: (_) => MasterProvider()),
        ChangeNotifierProvider(create: (_) => RevenueProvider()),


      ],
      child: MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý chợ - Thương nhân',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: AppColors.blue_w500,
      ),
      routes: <String,WidgetBuilder>{
        "/home": (BuildContext context) => HomeScreen(),
        "/setting": (BuildContext context) => SettingPage(),
        "/revenueDetail": (BuildContext context) => RevenueDetailPage(),
        // "/about": (BuildContext context) => AboutPage(),
        "/account": (BuildContext context) => AccountPage(),
        // "/changePassword": (BuildContext context) => ChangePasswordPage(),
        "/onboarding": (BuildContext context) => OnBoardingPage(),
        "/selectdistrict": (BuildContext context) => SelectDistrictPage(),
        "/login": (BuildContext context) => LoginPage(),
      },
      home: SplashScreen(),
    );
  }
}
