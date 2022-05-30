import 'package:flutter/material.dart';
import '../configs/themes/app_colors.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: Text('Thông tin phần mềm',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true ,
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text("Thông tin phần mềm",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            AboutList(title: "Phiên bản phần mềm", subString: "Version: v1.0", circleColor: Colors.transparent, icon: Icons.streetview),
            //AboutList(title: "Phiên bản kế tiếp", subString: "Chưa có kế hoạch cho phiên bản mới", circleColor: Colors.transparent, icon: Icons.assistant_photo),

            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text("Thông tin nhà phát triển",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            AboutList(title: "Đơn vị chủ quản", subString: "Phòng Kinh Tế", circleColor: Colors.transparent, icon: Icons.next_week),
            AboutList(title: "Đơn vị phát triển", subString: "Tien Phong Information Technology Solution Co.,LTD", circleColor: Colors.transparent, icon: Icons.developer_mode),
            AboutList2(title: "Hỗ trợ",subString: "Website: www.tpsoft.vn", subString1: "Email: thach.ngo@tpsoft.vn", circleColor: Colors.transparent, icon: Icons.lightbulb_outline),
          ],
        ),
      ),
    );
  }
}





class AboutList extends StatelessWidget {

  AboutList({this.title,this.subString, this.icon, this.circleColor});
  final String title;
  final String subString;
  final IconData icon;
  final Color  circleColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black26))),
            child: CircleAvatar(
              backgroundColor: circleColor,
              radius: 30.0,
              child: Icon(icon, color: Colors.green,size: 30.0,),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex:  2,
                  child: Text(subString, style: TextStyle(color: Colors.black))
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AboutList2 extends StatelessWidget {

  AboutList2({this.title,this.subString,this.subString1, this.icon, this.circleColor});
  final String title;
  final String subString,subString1;
  final IconData icon;
  final Color  circleColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black26))),
            child: CircleAvatar(
              backgroundColor: circleColor,
              radius: 30.0,
              child: Icon(icon, color: Colors.green,size: 30.0,),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subString, style: TextStyle(color: Colors.black)),
              Text(subString1, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}