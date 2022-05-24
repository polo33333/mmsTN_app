import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import '../../helpers/revenue_helper.dart';
import '../../provider/revenue_provider.dart';
import 'package:provider/provider.dart';

class RevenuePage extends StatefulWidget {
  @override
  _RevenuePageState createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final RevenueHelper _revenue = RevenueHelper();

  String _month = DateTime.now().month.toString();
  String _year = DateTime.now().year.toString();
  final _yearCurr = DateTime.now().year;

  String selectedValue = DateTime.now().month.toString();

  final List<String> _monthList = [
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

  List<String> _yearList = [];

  @override
  void initState() {
    super.initState();

    _yearList = [
      (_yearCurr).toString(),
      (_yearCurr - 1).toString(),
      (_yearCurr - 2).toString(),
      (_yearCurr - 3).toString(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //final f = new DateFormat('dd-MM-yyyy');
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.blue_w500,
          title: const Text(
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
          actions: const <Widget>[],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Tháng",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 20.09,
                      ),
                      isExpanded: false,
                      value: _month,
                      items: _monthList.map((String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        _month = newVal;
                        setState(() {});
                      }),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Năm",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 20.09,
                      ),
                      isExpanded: true,
                      value: _year,
                      items: _yearList.map((String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        _year = newVal;
                        setState(() {});
                      }),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5.0),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        _revenue.Search(int.parse(_month), int.parse(_year))
                            .then((result) {
                          if (result != null) {
                            var pr = Provider.of<RevenueProvider>(context,
                                listen: false);
                            pr.setRevenueList(result.data, notify: false);

                            Navigator.of(context).pushNamed('/revenueDetail');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.red // This is what you need!
                          ),
                      child: const Text("Tìm kiếm",
                          style: TextStyle(fontSize: 18))),
                )
              ],
            )));
  }
}
