import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configs/app_config.dart';
import '../configs/themes/app_colors.dart';
import '../helpers/apihelper.dart';
import '../helpers/master_helper.dart';
import '../modules/contract_page.dart';
import '../modules/feedback_page.dart';
import '../modules/revenue/revenueSearch_page.dart';
import '../provider/market_provider.dart';
import '../provider/master_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'kiot/kiot_selectMarket.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'assets/images/cho-ben-thanh-1.jpg',
  'assets/images/cho-1.jpg',
  'assets/images/cho-2.jpg',
  'assets/images/cho-3.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                // child: Text(
                //   'No. ${imgList.indexOf(item)} image',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _userName = prefs.getString('HouseholdBusinessName') ?? '';
    return _userName;
  }

  _getMaster({bool refresh = true}) async {
    var provider1 = Provider.of<MasterProvider>(context, listen: false);

    var postsResponse2 = await MasterHelper.getAll();
    if (postsResponse2.isSuccessful) {
      if (postsResponse2.data.isNotEmpty) {
          provider1.setMasterList(postsResponse2.data, notify: false);
        }
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
    //_userName = _getUserName();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: Colors.green,
          title: Container(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 20.0,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<dynamic>(
                          future: _getUserName(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                "Welcome, " + snapshot.data,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              );
                            }

                            return const Text(
                              "Welcome",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            );
                          }),
                    ],
                  ),
                ),
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: const Text(
                  'Danh mục',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Container(
              color: Colors.white,
              height: bodyHeight / 5 * 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio:
                  (2 * widthScreen + 10) / (1 * bodyHeight + 10),
                  padding: const EdgeInsets.all(3),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Trang chủ",
              // title: Text("Trang chủ",
              //   style: TextStyle(
              //     //fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.notifications,size: 30),
            //   title: Text("Thông báo"),
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: "Cài đặt",
              // title: Text("Cài đặt",
              //   style: TextStyle(
              //     //fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            //_selectedIndex = index;
            switch (index) {
              case 0:
                {
                  if (_selectedIndex != 0) {
                    Navigator.pushNamed(context, "/home");
                  }
                  break;
                }
            // case 1:
            //   Navigator.pushNamed(context, "/notification");
            //   break;
              case 1:
                Navigator.pushNamed(context, "/setting");
                break;
            }
          }),
    );
  }

  Widget makeDashboardItem(
      String title, IconData icon, Color colorBox, Widget router) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(),
              Container(
                //color: Colors.green,
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              Container(
                //color: Colors.green,
                alignment: Alignment.center,
                width: double.infinity,
                height: 30,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          if (router != null) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child: router));
          }
        },
      ),
    );
  }
}
