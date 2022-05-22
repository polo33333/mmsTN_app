import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';

class KiotPage extends StatefulWidget {
  @override
  _KiotState createState() => _KiotState();
}

class _KiotState extends State<KiotPage> {
  // final AuthRepos _auth = AuthRepos();
  //Future<Employee> _employee;

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
          'Điểm kinh doanh',
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
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            margin: new EdgeInsets.symmetric(horizontal: 20.0),
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
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: Icon(Icons.business_sharp),
                          labelText: 'Chợ',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _color,
                              items: _colors.map((String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String newValue) {}),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: '',
                        labelText: 'Mã điểm kinh doanh'),
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: Icon(Icons.place),
                          labelText: 'Khu vực',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _color,
                              items: _colors.map((String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String newValue) {}),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: Icon(Icons.place),
                          labelText: 'Chợ',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _color,
                              items: _colors.map((String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String newValue) {}),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: Icon(Icons.merge_type),
                          labelText: 'Ngành hàng',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _color,
                              items: _colors.map((String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String newValue) {}),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: Icon(Icons.add_circle_outlined),
                          labelText: 'Tình trạng',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: null,
                              items: null,
                              onChanged: (String newValue) {}),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'please select a color';
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => setState(() => true),
                        child: new Text("Tìm kiếm"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue // This is what you need!
                        )),
                  )
                ]),
          )
        ]),
      ),
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
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: CircleAvatar(
              backgroundColor: circleColor,
              radius: 30.0,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child:
                  Text(subString, style: TextStyle(color: Colors.white))),
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
            backgroundColor: Colors.blue,
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
            style: TextStyle(color: Colors.white, fontSize: 30.0),
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
