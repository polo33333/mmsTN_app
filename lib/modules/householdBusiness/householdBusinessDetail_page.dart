import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/models/market.dart';
import 'package:intl/intl.dart';

class HouseholdBusinessDetailPage extends StatefulWidget {
  var householdBusiness;
  HouseholdBusinessDetailPage({this.householdBusiness});

  @override
  _HouseholdBusinessDetailPageState createState() =>
      _HouseholdBusinessDetailPageState();
}

class _HouseholdBusinessDetailPageState
    extends State<HouseholdBusinessDetailPage> {
  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('dd-MM-yyyy');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: Text(
          'Chi tiết thương nhân',
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
                widget.householdBusiness.householdBusinessName == null
                    ? ""
                    : widget.householdBusiness.householdBusinessName,
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
                elevation: 5.0,
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
                                  title: "CMND/CCCD: ",
                                  value: widget.householdBusiness.iDNo == null
                                      ? ""
                                      : widget.householdBusiness.iDNo
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Mã số  thuế: ",
                                  value:
                                      widget.householdBusiness.taxCode == null
                                          ? ""
                                          : widget.householdBusiness.taxCode
                                              .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số ĐT: ",
                                  value: widget.householdBusiness.mobile == null
                                      ? ""
                                      : widget.householdBusiness.mobile
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Email: ",
                                  value: widget.householdBusiness.email == null
                                      ? ""
                                      : widget.householdBusiness.email
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Chợ: ",
                                  value: widget.householdBusiness.marketName ==
                                          null
                                      ? ""
                                      : widget.householdBusiness.marketName
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Hình thức: ",
                                  value:
                                      widget.householdBusiness.formName == null
                                          ? ""
                                          : widget.householdBusiness.formName
                                              .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Địa chỉ tạm trú: ",
                                  value: widget.householdBusiness
                                              .temporaryAddress ==
                                          null
                                      ? ""
                                      : widget
                                          .householdBusiness.temporaryAddress
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Địa chỉ thường trú: ",
                                  value: widget.householdBusiness
                                              .permanentAddress ==
                                          null
                                      ? ""
                                      : widget
                                          .householdBusiness.permanentAddress
                                          .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số GCN ĐKKD: ",
                                  value:
                                      widget.householdBusiness.licenseNo == null
                                          ? ""
                                          : widget.householdBusiness.licenseNo
                                              .toString()),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Ngày cấp GCN: ",
                                  value: widget.householdBusiness.licenseDate ==
                                          null
                                      ? ""
                                      : f.format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(widget.householdBusiness.licenseDate
                                          .replaceAll(
                                          RegExp(
                                              '[^0-9]'),
                                          '')))).toString(),),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Tình trạng: ",
                                  value: widget.householdBusiness.statusName ==
                                          null
                                      ? ""
                                      : widget.householdBusiness.statusName),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Giấy ATTP: ",
                                  value:
                                      widget.householdBusiness.isATTPLicense ==
                                              true
                                          ? "Có"
                                          : "Không"),
                              SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Cam kết lĩnh vực kinh doanh: ",
                                  value: widget.householdBusiness
                                              .commitBusinessField ==
                                          null
                                      ? ""
                                      : widget.householdBusiness
                                          .commitBusinessField),
                            ])))),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Thông tin chi tiết",
            //     style: TextStyle(
            //       color: Colors.black.withOpacity(0.5),
            //     ),
            //   ),
            // ),
            // Card(
            //     elevation: 8.0,
            //     margin:
            //         new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            //     child: Container(
            //         decoration: BoxDecoration(color: Colors.white),
            //         child: ListTile(
            //             contentPadding: EdgeInsets.symmetric(
            //                 horizontal: 20.0, vertical: 10.0),
            //             subtitle: Column(
            //                 mainAxisSize: MainAxisSize.max,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   LineData(
            //                       title: "Chợ: ",
            //                       value: widget.householdBusiness.marketName ==
            //                               null
            //                           ? ""
            //                           : widget.householdBusiness.marketName
            //                               .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Hình thức: ",
            //                       value:
            //                           widget.householdBusiness.formName == null
            //                               ? ""
            //                               : widget.householdBusiness.formName
            //                                   .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Địa chỉ tạm trú: ",
            //                       value: widget.householdBusiness
            //                                   .temporaryAddress ==
            //                               null
            //                           ? ""
            //                           : widget
            //                               .householdBusiness.temporaryAddress
            //                               .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Địa chỉ thường trú: ",
            //                       value: widget.householdBusiness
            //                                   .permanentAddress ==
            //                               null
            //                           ? ""
            //                           : widget
            //                               .householdBusiness.permanentAddress
            //                               .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Số GCN ĐKKD: ",
            //                       value:
            //                           widget.householdBusiness.licenseNo == null
            //                               ? ""
            //                               : widget.householdBusiness.licenseNo
            //                                   .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Ngày cấp GCN: ",
            //                       value: widget.householdBusiness.licenseDate ==
            //                               null
            //                           ? ""
            //                           : DateTime.fromMillisecondsSinceEpoch(
            //                                   int.parse(widget
            //                                       .householdBusiness.licenseDate
            //                                       .replaceAll(
            //                                           RegExp('[^0-9]'), '')))
            //                               .toString()),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Tình trạng: ",
            //                       value: widget.householdBusiness.statusName ==
            //                               null
            //                           ? ""
            //                           : widget.householdBusiness.statusName),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Giấy ATTP: ",
            //                       value:
            //                           widget.householdBusiness.isATTPLicense ==
            //                                   true
            //                               ? "Có"
            //                               : "Không"),
            //                   SizedBox(
            //                     width: double.infinity,
            //                     height: 5,
            //                   ),
            //                   LineData(
            //                       title: "Cam kết lĩnh vực kinh doanh: ",
            //                       value: widget.householdBusiness
            //                                   .commitBusinessField ==
            //                               null
            //                           ? ""
            //                           : widget.householdBusiness
            //                               .commitBusinessField),
            //                 ])))),
          ],
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
