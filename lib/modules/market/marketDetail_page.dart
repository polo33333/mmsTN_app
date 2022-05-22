import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/models/market.dart';

class MarketDetailPage extends StatefulWidget {
  var market;
  MarketDetailPage({this.market});

  @override
  _MarketDetailState createState() => _MarketDetailState();
}

class _MarketDetailState extends State<MarketDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: Text(
          'Chi tiết chợ',
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.market.marketName == null
                    ? ""
                    : widget.market.marketName,
                style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Thông tin chung",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        subtitle: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LineData(
                                  title: "Loại chợ: ",
                                  value: widget.market.marketTypeName == null
                                      ? ""
                                      : widget.market.marketTypeName),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Diện tích: ",
                                  value: widget.market.area == null
                                      ? ""
                                      : widget.market.area.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Khu vực/vị trí : ",
                                  value: widget.market.region == null
                                      ? ""
                                      : widget.market.region == 0
                                          ? ""
                                          : widget.market.region),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Địa chỉ: ",
                                  value: widget.market.address == null
                                      ? ""
                                      : widget.market.address),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Đơn vị quản lý: ",
                                  value: widget.market.companyName == null
                                      ? ""
                                      : widget.market.companyName),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số ĐKD theo TK: ",
                                  value: widget.market.sDKDTTK == null
                                      ? ""
                                      : widget.market.sDKDTTK.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Quyền sử dụng ĐKD nhà nước: ",
                                  value: widget.market.qSDDKDNN == null
                                      ? ""
                                      : widget.market.qSDDKDNN +  widget.market.qSDDKDCNTC == 0 ? "0%":  (100* widget.market.qSDDKDNN/(widget.market.qSDDKDNN +  widget.market.qSDDKDCNTC)).toStringAsFixed(2) + "%"),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Quyền sử dụng ĐKD cá nhân/tổ chức: ",
                                  value: widget.market.qSDDKDCNTC == null
                                      ? ""
                                      : widget.market.qSDDKDNN +  widget.market.qSDDKDCNTC == 0 ? "0%":  (100* widget.market.qSDDKDCNTC/(widget.market.qSDDKDNN +  widget.market.qSDDKDCNTC)).toStringAsFixed(2) + "%"),
                            ])))),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Thông tin chi tiết",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        subtitle: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LineData(
                                  title: "Số ĐKD đang hoạt động: ",
                                  value: widget.market.sDKDDHD == null
                                      ? ""
                                      : widget.market.sDKDDHD.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số ĐKD làm kho: ",
                                  value: widget.market.sDKDLK == null
                                      ? ""
                                      : widget.market.sDKDLK.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số ĐKD còn trống : ",
                                  value: widget.market.sDKDCT == null
                                      ? ""
                                      : widget.market.sDKDCT.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số TN có GCN ĐKKD: ",
                                  value: widget.market.sTNCGCNDKKD == null
                                      ? ""
                                      : widget.market.sTNCGCNDKKD.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số TN có GCN ATTP: ",
                                  value: widget.market.sTNCGCNATTP == null
                                      ? ""
                                      : widget.market.sTNCGCNATTP.toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số TN có KSK: ",
                                  value: widget.market.sTNCKSK == null
                                      ? ""
                                      : widget.market.sTNCKSK.toString()),
                            ])))),
          ],
        ),
      ),
    );
  }
}

class AboutList extends StatelessWidget {
  AboutList({this.title, this.subString, this.icon, this.circleColor});
  final String title;
  final String subString;
  final IconData icon;
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 15.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black26))),
            child: CircleAvatar(
              backgroundColor: circleColor,
              radius: 30.0,
              child: Icon(
                icon,
                color: Colors.green,
                size: 30.0,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: AppColors.kPrimaryColor, fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Text(subString,
                      style: TextStyle(color: Colors.black, fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutList2 extends StatelessWidget {
  AboutList2(
      {this.title,
      this.subString,
      this.subTitle1,
      this.subTitle2,
      this.subTitle3,
      this.subValue1,
      this.subValue2,
      this.subValue3,
      this.icon,
      this.circleColor});
  final String title;
  final String subString,
      subTitle1,
      subTitle2,
      subTitle3,
      subValue1,
      subValue2,
      subValue3;
  final IconData icon;
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          subtitle: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: subTitle1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                TextSpan(
                    text: subValue1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ])),
              SizedBox(
                width: double.infinity,
                height: 5,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: subTitle2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                TextSpan(
                    text: subValue2,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ])),
              SizedBox(
                width: double.infinity,
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                height: 5,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: subTitle3,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                TextSpan(
                    text: subValue3,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ])),

              // Text(subString1.value, style: TextStyle(color: Colors.black)),
              // Text(subString2.value, style: TextStyle(color: Colors.black)),
              // Text(subString3, style: TextStyle(color: Colors.black)),
              // Text(subString4, style: TextStyle(color: Colors.black)),
              // Text(subString5, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}

class LineData extends StatelessWidget {
  LineData({this.title, this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: title,
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
    ]));
  }
}
