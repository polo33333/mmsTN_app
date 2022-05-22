import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mms_1/widgets/flash_message_screen.dart';
import '../../widgets/colorLoader.dart';
import '../../configs/themes/app_colors.dart';
import '../../helpers/Auth_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final AuthRepos _auth = AuthRepos();
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    Widget loadingIndicator = _load
        ? new Container(
            color: Colors.transparent,
            width: 70.0,
            height: 70.0,
            child: ColorLoader(
              radius: 15.0,
              dotRadius: 6.0,
            ),
          )
        : new Container();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.red,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.blue_w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                width: size.width,
                height: defaultLoginSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: " M ",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                backgroundColor: AppColors.blue_w300)),
                        TextSpan(
                            text: " M ",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                backgroundColor: AppColors.blue_w400)),
                        TextSpan(
                            text: " S ",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                backgroundColor: AppColors.blue_w500_1)),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tra cứu thông tin thương nhân',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      width: 200,
                      height: 80,
                      color: Colors.transparent,
                      child: Image.asset('assets/images/chobenthanh.png',
                          color: Colors.redAccent),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.kBackGroundColor,
                              ),
                              child: TextFormField(
                                cursorColor: AppColors.blue_w500,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone,
                                    color: AppColors.blue_w500,
                                  ),
                                  hintText: 'Số điện thoại',
                                  border: InputBorder.none,
                                ),
                                keyboardType: Platform.isIOS
                                    ? TextInputType.numberWithOptions(
                                        signed: true, decimal: true)
                                    : TextInputType.number,
                                validator: (val) {
                                  if (val.length == 0)
                                    return "Nhập số điện thoại";
                                  else
                                    return null;
                                },
                                onSaved: (val) => _name = val,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.kBackGroundColor,
                              ),
                              child: TextFormField(
                                //obscureText: true,
                                cursorColor: AppColors.blue_w500,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                    color: AppColors.blue_w500,
                                  ),
                                  hintText: 'Mã hợp đồng',
                                  border: InputBorder.none,
                                ),
                                validator: (val) {
                                  if (val.length == 0)
                                    return "Nhập mã hợp đồng";
                                  else
                                    return null;
                                },
                                onSaved: (val) => _password = val,
                              ),
                            ),
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _onLoginClick();
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.blue_w500,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: double.infinity,
          //     height: size.height * 0.07,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(100),
          //       topRight: Radius.circular(100),
          //     )),
          //     alignment: Alignment.center,
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Text(
          //         'Copyright © 2022 Tpsoft',
          //         style: TextStyle(color: AppColors.blue_w500, fontSize: 18),
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            child: loadingIndicator,
            alignment: FractionalOffset.bottomCenter,
          ),
        ],
      ),
    );
  }

  void _showModalSheet() {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (builder) {
    //       return Container(
    //         height: MediaQuery.of(context).size.height / 10 * 2,
    //         child: Column(
    //           children: <Widget>[
    //             Icon(
    //               Icons.sentiment_very_dissatisfied,
    //               color: Colors.red,
    //               size: 60,
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 8, bottom: 5),
    //               child: Text(
    //                 'Đăng nhập không thành công!',
    //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    //               ),
    //             ),
    //             Text(
    //               'Xin vui lòng kiểm tra lại thông tin tài khoản',
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ],
    //         ),
    //       );
    //     });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: FlashMessageScreen("Oh no!",
          "Đăng nhập không thành công, Vui lòng kiểm tra lại!"),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void _onLoginClick() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _load = true;
      });
      _auth.signIn(_name, _password).then((result) {
        Timer(Duration(seconds: 2), () {
          if (result) {
            setState(() {
              _load = false;
            });
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            setState(() {
              _load = false;
            });
//            MsgDialog.showMsgDialog(
//                context, "Thông báo", 'Đăng nhập không thành công!');
            _showModalSheet();
          }
        });
      });
    }
  }
}
