import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import 'package:intl/intl.dart';

class KiotDetailPage extends StatefulWidget {
  var kiot;
  KiotDetailPage({this.kiot});

  @override
  _KiotDetailPageState createState() => _KiotDetailPageState();
}

class _KiotDetailPageState extends State<KiotDetailPage> {
  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('dd-MM-yyyy');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: const Text(
          'Chi tiết điểm kinh doanh',
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
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.kiot.kiotName == null ? "" : widget.kiot.kiotName,
                style: const TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(15, 5.0, 15, 5.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: const Text(
                "Thông tin chung",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Card(
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        subtitle: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LineData(
                                  title: "Mã ĐKD: ",
                                  value: widget.kiot.kiotCode == null
                                      ? ""
                                      : widget.kiot.kiotCode),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Diện tích: ",
                                  value: widget.kiot.area == null
                                      ? ""
                                      : widget.kiot.area.toString()),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Khu vực/vị trí : ",
                                  value: widget.kiot.regionName == null
                                      ? ""
                                      : widget.kiot.regionName),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Ngành hàng: ",
                                  value: widget.kiot.productGroupName == null
                                      ? ""
                                      : widget.kiot.productGroupName),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Loại ĐKD: ",
                                  value: widget.kiot.kiotTypeName == null
                                      ? ""
                                      : widget.kiot.kiotTypeName),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Làm kho: ",
                                  value: widget.kiot.isStore == null? "":  widget.kiot.isStore == true? "Có" : "Không"),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Tình trạng: ",
                                  value: widget.kiot.statusName == null
                                      ? ""
                                      : widget.kiot.statusName),
                            ])))),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(15, 5.0, 15, 5.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: const Text(
                "Quyền sử dụng",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Card(
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        subtitle: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LineData(
                                  title: "Số GCN QSD ĐKD/GCN: ",
                                  value: widget.kiot.qSDLicenseNo == null
                                      ? ""
                                      : widget.kiot.qSDLicenseNo.toString()),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Ngày cấp: ",
                                  value: widget.kiot.qSDLicenseDate == null
                                      ? ""
                                      : f.format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(widget
                                          .kiot.qSDLicenseDate
                                          .replaceAll(
                                          RegExp(
                                              '[^0-9]'),
                                          '')))).toString(),
                              ),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Họ và tên: ",
                                  value: widget.kiot.qSDFullName == null
                                      ? ""
                                      : widget.kiot.qSDFullName),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "CMND/CCCD: ",
                                  value: widget.kiot.qSDIDNo == null
                                      ? ""
                                      : widget.kiot.qSDIDNo.toString()),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Điện thoại: ",
                                  value: widget.kiot.qSDPhone == null
                                      ? ""
                                      : widget.kiot.qSDPhone),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Địa chỉ: ",
                                  value: widget.kiot.qSDAddress == null
                                      ? ""
                                      : widget.kiot.qSDAddress),
                            ])))),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(15, 5.0, 15, 5.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: const Text(
                "Người kinh doanh",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Card(
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        subtitle: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LineData(
                                  title: "Họ và tên: ",
                                  value: widget.kiot.nKDFullName == null
                                      ? ""
                                      : widget.kiot.nKDFullName),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "CMND/CCCD: ",
                                  value: widget.kiot.nKDIDNo == null
                                      ? ""
                                      : widget.kiot.nKDIDNo.toString()),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Điện thoại: ",
                                  value: widget.kiot.nKDPhone == null
                                      ? ""
                                      : widget.kiot.nKDPhone),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Địa chỉ: ",
                                  value: widget.kiot.nKDAddress == null
                                      ? ""
                                      : widget.kiot.nKDAddress),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Mã số thuế: ",
                                  value: widget.kiot.nKDTaxCode == null
                                      ? ""
                                      : widget.kiot.nKDTaxCode),
                              const SizedBox(
                                width: double.infinity,
                                height: 5,
                              ),
                              LineData(
                                  title: "Số GCN ĐKKD: ",
                                  value: widget.kiot.nKDLicenseNo == null
                                      ? ""
                                      : widget.kiot.nKDLicenseNo),
                            ])))),
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
          style: const TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      TextSpan(
          text: value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
    ]));
  }
}
