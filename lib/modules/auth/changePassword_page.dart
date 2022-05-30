import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/colorLoader.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {


  final _formKey = GlobalKey<FormState>();
  //String _newPassword;
  String _reTypepassword;
  String _password;
  var _newPassword = GlobalKey<FormFieldState>();

  bool _load = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    Widget loadingIndicator =_load? new Container(
      color: Colors.transparent,
      width: 70.0,
      height: 70.0,
      child: ColorLoader(radius: 15.0, dotRadius: 6.0,),
    ):new Container();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        title: Text('Thay đổi mật khẩu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
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
            SizedBox(height: 80.0,),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.transparent.withOpacity(.3),
                    width: .2,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu hiện tại',
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintStyle: TextStyle(color: Colors.black12),
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.vpn_key,color: Colors.black,),
                          ),
                          border: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 11,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                        ),
                        obscureText: true,
                        validator: (val) {
                          if (val.length == 0)
                            return "Nhập mật khẩu hiện tại";
                          else if (val.length < 6)
                            return "Mật khẩu không hợp lệ";
                          else
                            return null;
                        },
                        onSaved: (val) => _password = val,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        key: _newPassword,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu mới',
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixStyle: TextStyle( color: Colors.black),
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.vpn_key,color: Colors.black,),
                          ),

                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 11,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        obscureText: true,
                        validator: (val) {
                          if (val.length == 0)
                            return "Nhập mật khẩu mới";
                          else if (val.length < 6)
                            return "Mật khẩu mới không hợp lệ";
                          else
                            return null;
                        },
                        //onSaved: (val) => _newPassword = val,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Nhắc lại mật khẩu mới',
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixStyle: TextStyle( color: Colors.black),
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.vpn_key,color: Colors.black,),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 11,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        obscureText: true,
                        validator: (val) {
                          var password = _newPassword.currentState.value;
                          if (val.length == 0)
                            return "Nhắc lại mật khẩu mới";
                          else if (val.length < 6)
                            return "Mật khẩu mới không hợp lệ";
                          else
                          if (val != password)
                            return "Không trùng với mật khẩu mới";
                          else
                            return null;
                        },
                        onSaved: (val) => _reTypepassword = val,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: RaisedButton(
                  onPressed: (){
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _onSubmitClick();
                  },
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
            ),


            Align(child: loadingIndicator,alignment: FractionalOffset.center,),

          ],
        ),
      ),
    );
  }


  void _showModalSheet(String msg, IconData icon) {
    showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        height: MediaQuery.of(context).size.height/10 *2,
        child: Column(
          children: <Widget>[
            Icon(icon, color: Colors.red, size: 60,),
            Container(
              padding: EdgeInsets.only(top: 8,bottom: 5),
              child: Text(msg,
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      );
    });
  }
  void _onSubmitClick() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _load = true;
      // _auth.changePassword(_newPassword.currentState.value, _password).then((result) {
      //   Timer(Duration(seconds: 2), () {
      //     if (result) {
      //       setState(() {
      //         _load = false;
      //       });
      //       _showModalSheet('Thay đổi mật khẩu thành công!',Icons.sentiment_satisfied);
      //       _auth.signOut();
      //       Timer(Duration(seconds: 2), () {
      //         Navigator.of(context)
      //             .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      //       });
      //
      //
      //     } else {
      //
      //       setState(() {
      //         _load = false;
      //       });
      //
      //       _showModalSheet('Thay đổi mật khẩu không thành công!',Icons.sentiment_very_dissatisfied);
      //     }
      //   });
      //
      //
      // }
      //);

      setState((){
        _load=true;
      });
    }
  }
}