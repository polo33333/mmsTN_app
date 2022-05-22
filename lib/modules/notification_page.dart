import 'package:flutter/material.dart';
import 'package:mms_1/configs/themes/app_colors.dart';


class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationPageState();
  }
}

class NotificationPageState extends State<NotificationPage> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        centerTitle: true,
        title: Text(
          'Thông báo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: new Center(
        child:  new Image.asset(
          'assets/images/nodata2.png',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
