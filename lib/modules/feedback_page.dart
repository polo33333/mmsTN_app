import 'package:flutter/material.dart';
import '../configs/app_config.dart';
import '../configs/themes/app_colors.dart';
import '../helpers/apihelper.dart';
import '../helpers/report_helper.dart';
import '../models/master.dart';
import '../provider/market_provider.dart';
import '../provider/master_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  final ReportRepos _report = ReportRepos();
  var masterValue;
  TextEditingController _title = new TextEditingController();
  TextEditingController _content = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _mobile = new TextEditingController();

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

    Future.delayed(const Duration(milliseconds: 500), () async {
      _getMarkets(refresh: false);
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final f = new DateFormat('dd-MM-yyyy');
    Size size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final provider2 = Provider.of<MarketProvider>(context);
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.blue_w500,
          title: const Text(
            'Phản ánh',
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height - (size.height * 0.2),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Chợ",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          cursorColor: const Color(0xFF000000),
                          readOnly: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.home,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: provider2.currentItemSelect.marketName,
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Loại phản ánh ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: "(*)",
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ])),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Consumer<MasterProvider>(
                          builder: (_, provider2, __) {
                            return DropdownButtonFormField<Master>(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.remove),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 20.09,
                              ),
                              hint: const Text("Vui lòng chọn loại phản ánh..."),
                              isExpanded: true,
                              value: masterValue,
                              onChanged: (Master newValue1) {
                                setState(() {
                                  masterValue = newValue1;
                                });
                              },
                              items: provider2.masterList
                                  .map<DropdownMenuItem<Master>>((Master master) {
                                return DropdownMenuItem<Master>(
                                  value: master,
                                  child: Text(master.name),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Tiêu đề ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: "(*)",
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ])),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _title,
                          cursorColor: const Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.title,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Nhập tiêu đề..",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Nội dung phản ánh ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: "(*)",
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ])),
                      ),
                      Container(
                        width: double.infinity,
                        height: 70,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _content,
                          cursorColor: const Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.content_copy,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Nhập nội dung phản ánh..",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Địa chỉ",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _address,
                          cursorColor: const Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.place,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Nhập điểm dịa chỉ..",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Điện thoại liên lạc",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          controller: _mobile,
                          cursorColor: const Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: const Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Nhập điện thoại liên hệ..",
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(5.0),
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_title.text.isNotEmpty &&
                                  _content.text.isNotEmpty &&
                                  masterValue != null) {
                                _report
                                    .sendReport(
                                        masterValue.masterID,
                                        _title.text,
                                        _content.text,
                                        _address.text,
                                        _mobile.text)
                                    .then((result) {
                                  if (result) _showMaterialDialog();
                                });
                              } else {
                                _showMaterialDialog_2();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.red // This is what you need!
                                ),
                            child: const Text("Gửi phản ánh")),
                      )
                    ],
                  ),
                )));
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text('Thông báo'),
            content: const Text('Gửi phản ánh thành công!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                  child: const Text('Close')),
            ],
          );
        });
  }

  void _showMaterialDialog_2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text('Thông báo'),
            content: const Text(
                'Vui lòng điền  các thông tin bắc buộc trước khi gửi phản ánh!'),
            actions: <Widget>[
              TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
                  child: const Text('Close')
              ),
            ],
          );
        });
  }
}
