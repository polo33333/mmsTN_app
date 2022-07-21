import 'package:flutter/material.dart';
import '../configs/themes/app_colors.dart';
import 'package:page_transition/page_transition.dart';
import '../helpers/Auth_helper.dart';
import 'about_page.dart';
import 'auth/account_page.dart';
import 'auth/changePassword_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  final AuthRepos _auth = AuthRepos();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _value1 = true;

  void initState() {
    super.initState();
  }

  void _onChanged1(bool value) => setState(() => _value1 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.blue_w500,
        centerTitle:true,
        title: const Text(
          'Cài đặt',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
        //centerTitle: true ,
        actions: const <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AccountPage()));
                  //Navigator.pushNamed(context, '/account');
                },
                child: Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 6.0),
                  child: Container(
                    decoration:
                    const BoxDecoration(color: Colors.white),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: const EdgeInsets.only(right: 12.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: const CircleAvatar(
                            radius: 25.0,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.yellow,
                              size: 45.0,
                            ),
                          ),
                        ),
                        title: const Text(
                          "Tài khoản",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Text("Tình trạng: Hoạt động",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 13.0)),
                          ],
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 30.0)),
                  ),
                )),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Thông báo",
            //     style: TextStyle(
            //       color: Colors.black.withOpacity(0.5),
            //     ),
            //   ),
            // ),
            // Card(
            //   elevation: 8.0,
            //   margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            //   child: Container(
            //     decoration:
            //     BoxDecoration(color: Colors.white),
            //     child: ListTile(
            //       contentPadding:
            //       EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //       leading: Container(
            //         padding: EdgeInsets.only(right: 12.0),
            //         child: CircleAvatar(
            //           backgroundColor: Colors.green,
            //           radius: 30.0,
            //           child: Icon(
            //             Icons.notifications_none,
            //             color: Colors.white,
            //             size: 30.0,
            //           ),
            //         ),
            //       ),
            //       title: Text(
            //         "Thông báo",
            //         style: TextStyle(
            //             color: Colors.black, fontWeight: FontWeight.bold),
            //       ),
            //       // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            //       trailing: Switch(value: _value1, onChanged: _onChanged1),
            //     ),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Hệ thống",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, '/about');
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AboutPage()));
              },
              child: Card(
                elevation: 8.0,
                margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration:
                  const BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25.0,
                        child: Icon(
                          Icons.developer_mode,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    title: const Text(
                      "Thông tin phần mềm",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.keyboard_arrow_right,
                        color: Colors.black, size: 30.0),
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: ChangePasswordPage()));
            //   },
            //   child: Card(
            //     elevation: 8.0,
            //     margin:
            //     new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            //     child: Container(
            //       decoration:
            //       BoxDecoration(color: Colors.white),
            //       child: ListTile(
            //           contentPadding: EdgeInsets.symmetric(
            //               horizontal: 20.0, vertical: 10.0),
            //           leading: Container(
            //             padding: EdgeInsets.only(right: 12.0),
            //             child: CircleAvatar(
            //               backgroundColor: Colors.blue,
            //               radius: 30.0,
            //               child: Icon(
            //                 Icons.vpn_key,
            //                 color: Colors.black,
            //                 size: 30.0,
            //               ),
            //             ),
            //           ),
            //           title: Text(
            //             "Thay đổi mật khẩu",
            //             style: TextStyle(
            //                 color: Colors.black, fontWeight: FontWeight.bold),
            //           ),
            //           // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            //           trailing: Icon(Icons.keyboard_arrow_right,
            //               color: Colors.black, size: 30.0)),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: _signOut_1,
              child: Card(
                elevation: 8.0,
                margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Container(
                  decoration:
                  const BoxDecoration(color: Colors.white),
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: const CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent,
                          radius: 25.0,
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                      title: const Text(
                        "Đăng xuất",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      trailing: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.black, size: 30.0)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Version: v1.0.3',
                style: TextStyle(
                    color: Colors.black12.withOpacity(.5), fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signOut() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: const Text(
        'Bạn có chắc chắn muốn đăng xuất?',
        style: TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 9),
      backgroundColor: Colors.red,
      action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            _auth.signOut().then((result) {
              if (result) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/onboarding', (Route<dynamic> route) => false);
              }
              setState(() {
                //someVal = result;
              });
            }
            );
          }),
    ));
  }


  void _signOut_1() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text('Đăng xuất',
                style: TextStyle(fontWeight: FontWeight.w500)),
            content: const Text('Bạn có muốn đăng xuất tài khoản?'),
            actions: [
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Hủy bỏ')),
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    _auth.signOut().then((result) {
                      if (result) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/onboarding', (Route<dynamic> route) => false);
                      }
                      setState(() {
                        //someVal = result;
                      });
                    });
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Đăng xuất',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          );
        });
  }
}