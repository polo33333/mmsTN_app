import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/models/market.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../configs/app_config.dart';
import '../../helpers/householdBusiness_helper.dart';
import '../../models/householdBusiness.dart';
import '../../provider/householdBusiness_provider.dart';
import 'householdBusinessDetail_page.dart';
import 'package:flutter/services.dart';

class HouseholdBusinessListPage extends StatefulWidget {
  @override
  _HouseholdBusinessListPageState createState() =>
      _HouseholdBusinessListPageState();
}

class _HouseholdBusinessListPageState extends State<HouseholdBusinessListPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  _showSnackbar(String message, {Color bgColor}) {
    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bgColor ?? Colors.red,
      ),
    );
  }

  _hideSnackbar() {
    _globalKey.currentState.hideCurrentSnackBar();
  }

  _getPosts({bool refresh = true}) async {
    var provider =
        Provider.of<HouseholdBusinessProvider>(context, listen: false);
    if (!provider.shouldRefresh) {
      _showSnackbar('That\'s it for now!');
      return;
    }
    if (refresh) _showSnackbar('Loading more...', bgColor: Colors.green);

    var postsResponse = await HouseholdBusinessHelper.getAll();
    if (postsResponse.isSuccessful) {
      if (postsResponse.data.isNotEmpty) {
        if (refresh) {
          provider.mergeHouseholdBusinessList(postsResponse.data,
              notify: false);
        } else {
          provider.setHouseholdBusinessList(postsResponse.data, notify: false);
        }
        provider.setCurrentPage(provider.currentPage + 1);
      } else {
        provider.setShouldRefresh(false);
      }
    } else {
      _showSnackbar(postsResponse.message);
    }
    provider.setIsHouseholdBusinessProcessing(false);
    _hideSnackbar();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          _getPosts();
        }
      }
    });
    _getPosts(refresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: SearchDrawer(),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 26,
          ),
          //tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(
          'Thương nhân',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 26.0,
            ),
            onPressed: () {
              _globalKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: Consumer<HouseholdBusinessProvider>(
        builder: (_, provider, __) => provider.isHouseholdBusinessProcessing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.householdBusinessListLength > 0
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    itemBuilder: (_, index) {
                      HouseholdBusiness post =
                          provider.getHouseholdBusinessByIndex(index);
                      return Card(
                          elevation: 1.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                              child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 30.0,
                            ),
                            title: Text(
                              post.householdBusinessName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            subtitle: Text(  "Chợ: " +
                              post.marketName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ), //element['group'] group name get
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: HouseholdBusinessDetailPage(
                                        householdBusiness: post)),
                              );
                            },
                          )));
                    },
                    itemCount: provider.householdBusinessListLength,
                  )
                : Center(
                    child: Text(AppConfig.nodata),
                  ),
      ),
    );
  }
}

class SearchDrawer extends StatefulWidget {
  @override
  _SearchDrawerState createState() => new _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  TextEditingController _mobile = new TextEditingController();
  TextEditingController _iDNo = new TextEditingController();
  TextEditingController _householdBusinessName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new Container(
            //color: Colors.white54,
            margin: new EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: new Column(children: <Widget>[
              Text(
                "Bộ lọc tìm kiếm",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Số điện thoại",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _mobile,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(12),
              ],
              cursorColor: Color(0xFF000000),
              onChanged: (value) => {},
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Nhập số điện thoại...",
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Tên thương nhân",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _householdBusinessName,
              cursorColor: Color(0xFF000000),
              onChanged: (value) => {},
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Nhập tên thương nhân...",
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "CMND/CCCD",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _iDNo,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(12),
              ],
              cursorColor: Color(0xFF000000),
              onChanged: (value) => {},
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.insert_drive_file_outlined,
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Nhập CMND/CCCD...",
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10.0),
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Provider.of<HouseholdBusinessProvider>(context, listen: false)
                      .changeSearchString(_mobile.text,
                          _householdBusinessName.text, _iDNo.text);
                  setState(() => true);
                },
                child: new Text("Tìm kiếm"),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.red // This is what you need!
                    )),
          )
        ],
      ),
    );
  }
}
