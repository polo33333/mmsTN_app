import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/modules/feedback_page.dart';
import 'package:mms_1/modules/revenue/revenueSearch_page.dart';
import 'package:page_transition/page_transition.dart';

import 'contract_page.dart';
import 'householdBusiness/householdBusinessList_page.dart';
import 'kiot/kiotList_page.dart';
import 'kiot/kiot_selectMarket.dart';
import 'market/market_page.dart';
import 'householdBusiness/householdBusiness_page.dart';
import 'kiot_page.dart';

import 'package:mms_1/provider/master_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mms_1/configs/app_config.dart';
import 'package:mms_1/helpers/apihelper.dart';
import 'package:mms_1/helpers/master_helper.dart';
import 'package:mms_1/provider/market_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getMaster({bool refresh = true}) async {
    var provider1 = Provider.of<MasterProvider>(context, listen: false);

    var postsResponse2 = await MasterHelper.getAll();
    if (postsResponse2.isSuccessful) {
      if (postsResponse2.data.isNotEmpty) {
        if (refresh) {
          provider1.mergeMasterList(postsResponse2.data, notify: false);
        } else {
          provider1.setMasterList(postsResponse2.data, notify: false);
        }
      } else {}
    } else {}
  }

  _getMarkets({bool refresh = true}) async {
    var provider1 = Provider.of<MarketProvider>(context, listen: false);

    var postsResponse1 = await APIHelper.getAll();
    if (postsResponse1.isSuccessful) {
      if (postsResponse1.data.isNotEmpty) {
        if (refresh) {
          provider1.mergeMarketList(postsResponse1.data, notify: false);
        } else {
          provider1.setMarketList(postsResponse1.data, notify: false);
        }
        provider1.setCurrentPage(provider1.currentPage + 1);
      } else {
        provider1.setShouldRefresh(false);
      }
    } else {
      //_showSnackbar(postsResponse1.message);
    }
    provider1.setIsMarketlPageProcessing(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int marketCurrent = prefs.getInt(AppConfig.MarketId) ?? 0;
    provider1.getMarketById(marketCurrent);

  }

  @override
  void initState() {
    super.initState();
    _getMarkets();
    _getMaster();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;
    //final double bottomHeight = 50;
    final double bodyHeight = screenHeight - statusBarHeight - 120;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
              backgroundColor: AppColors.blue_w500,
              automaticallyImplyLeading: false,
              title: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    Text(
                      'MMS',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Tra cứu thông tin thương nhân',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            color: Colors.white,
            height: bodyHeight,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (2 * widthScreen + 10) / (2 * bodyHeight),
                padding: EdgeInsets.all(3),
                children: <Widget>[
                  // makeDashboardItem("Thông tin chung", Icons.info_outline,
                  //     Colors.pink, MarketPage()),
                  makeDashboardItem("Điểm kinh doanh trống", Icons.place,
                      Colors.green, KiotSelectMarketScreen()),
                  makeDashboardItem("Hợp đồng thuê", Icons.assignment_rounded,
                      AppColors.deepPurple, ContractPage()),
                  makeDashboardItem(
                      "Các khoản nộp",
                      Icons.calendar_today_outlined,
                      AppColors.red,
                      RevenuePage()),
                  makeDashboardItem(
                      "Phản ánh",
                      Icons.report_gmailerrorred_outlined,
                      AppColors.blue_w400,
                      ReportPage()),
                  // makeDashboardItem(
                  //     "Cài đặt", Icons.settings, Colors.blueGrey, SettingPage()),
                  // makeDashboardItem(
                  //     "Comming soon", Icons.add, Colors.indigo,null),
                ],
              ),
            ),
          )
        ])),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text("Trang chủ"),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.notifications,size: 30),
              //   title: Text("Thông báo"),
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30),
                title: Text("Cài đặt"),
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, "/home");
                  break;
                // case 1:
                //   Navigator.pushNamed(context, "/notification");
                //   break;
                case 1:
                  Navigator.pushNamed(context, "/setting");
                  break;
              }
            }));
  }


  Card makeDashboardItem(
      String title, IconData icon, Color colorBox, Widget router) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bodyHeight = screenHeight - statusBarHeight - 60;
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
              color: colorBox,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: new InkWell(
              onTap: () {
                if (router != null)
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft, child: router));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    SizedBox(height: (1 / 10) * bodyHeight),
                    Center(
                        child: Icon(
                          icon,
                          size: 40.0,
                          color: Colors.white,
                        )),
                    SizedBox(height: (1 / 25) * bodyHeight),
                    new Center(
                      child: new Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                        child: new Text(title,
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ]),
            )));
  }
}


