import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';
import 'package:mms_1/helpers/report_helper.dart';
import 'package:mms_1/helpers/revenue_helper.dart';
import 'package:mms_1/provider/revenue_provider.dart';
import 'package:provider/provider.dart';

class RevenuePage extends StatefulWidget {
  @override
  _RevenuePageState createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  final RevenueHelper _revenue = RevenueHelper();

  String _month = DateTime.now().month.toString();
  String _year = DateTime.now().year.toString();

  List<String> _monthList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> _yearList = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031'
  ];

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



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //final f = new DateFormat('dd-MM-yyyy');
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.blue_w500,
          title: Text(
            'Các khoản nộp - Tìm kiếm',
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tháng",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 20.09,
                    ),
                    hint: Text("Vui lòng chọn chợ..."),
                    isExpanded: false,
                    value: _month,
                    items: _monthList.map((String val) {
                      return new DropdownMenuItem<String>(
                        value: val,
                        child: new Text(val),
                      );
                    }).toList(),
                      onChanged: (newVal) {
                        _month = newVal;
                        this.setState(() {});
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Năm",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 20.09,
                      ),
                      isExpanded: true,
                      value: _year,
                      items: _yearList.map((String val) {
                        return new DropdownMenuItem<String>(
                          value: val,
                          child: new Text(val),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        _year = newVal;
                        this.setState(() {});
                      }),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5.0),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        _revenue
                            .Search(int.parse(_month), int.parse(_year))
                            .then((result) {

                          if (result != null)  {

                            var pr = Provider.of<RevenueProvider>(context, listen: false);
                            pr.setRevenueList(result.data, notify: false);

                            Navigator.of(context).pushNamed(
                                '/revenueDetail');
                          }
                        });
                        // Navigator.of(context).pushNamed(
                        //     '/revenueDetail');
                      },
                      child: new Text("Tìm kiếm"),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.red // This is what you need!
                          )),
                )
              ],
            )));
  }
}
