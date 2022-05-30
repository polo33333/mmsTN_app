import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';

class HouseholdBusinessPage extends StatefulWidget {
  @override
  _HouseholdBusinessState createState() => _HouseholdBusinessState();
}

class _HouseholdBusinessState extends State<HouseholdBusinessPage> {
  void initState() {
    GetEmployeeInfo();
    super.initState();
  }

  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  Future<Null> GetEmployeeInfo() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      // _employee = _auth.getEmployeeInfo();
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
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        reverse: false,
        padding: EdgeInsets.all(10.0),
        child: Stack(children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height,
            margin: new EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFe9eaec),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          cursorColor: Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Số điện thoại",
                              border: InputBorder.none),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFe9eaec),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          cursorColor: Color(0xFF000000),
                          onChanged: (value) => {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF000000).withOpacity(0.5),
                              ),
                              hintText: "Tên thương nhân",
                              border: InputBorder.none),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFe9eaec),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      cursorColor: Color(0xFF000000),
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.insert_drive_file_outlined,
                            color: Color(0xFF000000).withOpacity(0.5),
                          ),
                          hintText: "CMND/CCCD",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => setState(() => true),
                        child: new Text("Tìm kiếm"),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.red // This is what you need!
                            )),
                  )
                ]),
          ),
        ]),
      ),
    );
  }
}