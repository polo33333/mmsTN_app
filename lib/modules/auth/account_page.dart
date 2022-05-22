import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/helpers/Auth_helper.dart';
import 'package:mms_1/models/householdBusiness.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<AccountPage> {
  final AuthRepos _auth = AuthRepos();
  Future<HouseholdBusiness> _householdBusiness;

  void initState() {
    GetHouseholdBusinessInfo();
    super.initState();
  }

  Future<Null> GetHouseholdBusinessInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _householdBusiness = _auth.getHouseholdBusinessInfo();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: Text(
          'Thông tin tài khoản',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            //color: Color(0xFF2d3447),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: _householdBusiness,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.search,size: 80,color: Colors.white.withOpacity(0.6),),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text('Dữ liệu trống',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white.withOpacity(0.6)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return snapshot.hasData
                          ? _colunm(
                          name: snapshot.data.householdBusinessName,
                          phone: snapshot.data.mobile,
                          email: snapshot.data.email,
                          address: snapshot.data.permanentAddress)
                          : Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ]),
        )
      ]),
    );
  }
}

class AccountList extends StatelessWidget {
  AccountList({this.title, this.subString, this.icon, this.circleColor});
  final String title;
  final String subString;
  final IconData icon;
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white54),
        child: ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black45))),
            child: CircleAvatar(
              backgroundColor: circleColor,
              radius: 30.0,
              child: Icon(
                icon,
                color: AppColors.blue_w500,
                size: 30.0,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child:
                  Text(subString, style: TextStyle(color: Colors.black54))),
            ],
          ),
        ),
      ),
    );
  }
}

class _colunm extends StatelessWidget {
  _colunm({this.name, this.phone, this.email, this.address});
  final String name, phone, email, address;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//            SizedBox(
//              height: 80.0,
//            ),
        Center(
          child: CircleAvatar(
            backgroundColor: AppColors.blue_w500,
            radius: 45.0,
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 90.0,
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(25.0),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),

        AccountList(
            title: "Điện thoại liên lạc",
            subString: "Phone: $phone",
            circleColor: Colors.transparent,
            icon: Icons.phone_android),
        AccountList(
            title: "Email:",
            subString: "Mail: $email",
            circleColor: Colors.transparent,
            icon: Icons.email),
        AccountList(
            title: "Địa chỉ:",
            subString: "" + address,
            circleColor: Colors.transparent,
            icon: Icons.add_location),
      ],
    );
  }
}