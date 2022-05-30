import 'dart:async';

import 'package:flutter/material.dart';
import '../configs/themes/app_colors.dart';
import '../widgets/colorLoader.dart';
import '../helpers/Auth_helper.dart';

class SplashScreen extends StatefulWidget {
  final String router;
  SplashScreen({Key key, @required this.router}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthRepos _auth = new AuthRepos();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _auth.checkIsAuthenticated().then((result) {
        //print("sp" + result.toString());
        if (result == true) {
          if (widget.router != null) {
            Timer(Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  widget.router, (Route<dynamic> route) => false);
            });
          } else {
            Timer(Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            });

          }
        } else
          Timer(Duration(seconds: 3), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/onboarding', (Route<dynamic> route) => false);
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            ColorLoader(
              radius: 30.0,
              dotRadius: 8.0,
            ),
          ]),
        ),
      ),
    );
  }
}