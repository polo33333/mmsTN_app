import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/flash_message_screen.dart';
import '../../widgets/colorLoader.dart';
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
    final height = MediaQuery.of(context).size.height;
    //double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    Widget loadingIndicator = _load
        ? Container(
            color: Colors.transparent,
            width: 70.0,
            height: 70.0,
            child: ColorLoader(
              radius: 15.0,
              dotRadius: 6.0,
            ),
          )
        : Container();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.green,),
                )),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                reverse: true,
                child: SizedBox(
                  width: size.width,
                  height: defaultLoginSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 280,
                        height: 220,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/splash_2.png',
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Đăng nhập hệ thống',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(15,5,15,0),
                                  child: Text(
                                    "Số điện thoại",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6)
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.blue_w500,
                                    width: 1,
                                  ),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
                                      color: AppColors.blue_w500,
                                    ),
                                    hintText: 'Nhập số điện thoại',
                                    hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: Platform.isIOS
                                      ? const TextInputType.numberWithOptions(
                                          signed: true, decimal: true)
                                      : TextInputType.number,
                                  onSaved: (val) => _name = val,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(15,5,15,0),
                                  child: Text(
                                    "Mã hợp đồng",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6)
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.blue_w500,
                                    width: 1,
                                  ),
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      color: AppColors.blue_w500,
                                    ),
                                    hintText: 'Nhập mã hợp đồng',
                                    hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (val) => _password = val,
                                ),
                              ),
                            ],
                          )),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: SizedBox(
                          height: 45,
                          child: TextButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                _onLoginClick();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.blue_w500),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Text(
                                "ĐĂNG NHẬP",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: loadingIndicator,
            ),
          ],
        ),
      ),
    );
  }

  void _showModalSheet() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: FlashMessageScreen(
          "Oh no!", "Đăng nhập không thành công, Vui lòng kiểm tra lại!"),
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
      //print(_name + _password);
      _auth.signIn(_name, _password).then((result) {
        Timer(const Duration(seconds: 2), () {
          if (result) {
            setState(() {
              _load = false;
            });
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (Route<dynamic> route) => false);
          } else {
            setState(() {
              _load = false;
            });

            _showModalSheet();
          }
        });
      });
    }
  }
}
