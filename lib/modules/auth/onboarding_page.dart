import 'dart:io';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('MMS',
              style: TextStyle(
                height: 2,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const Text('Chào mừng bạn đã đến với MMS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/splash_3.png',
              height: 270,
              width: 280,
            ),
            const Spacer(),
            const Text('Quản lý chợ - Thương nhân',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const Text(
                  "Quản lý và tra cứu thông tin hợp đồng, điểm kinh doanh trống, các khoản nộp, ghi nhận phản ánh.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 14,
                  )),
            ),
            const Spacer(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: () => {
        Navigator.of(context).pushNamedAndRemoveUntil(
        '/selectdistrict', (Route<dynamic> route) => false)
        },
        child: Container(
          height: Platform.isIOS ? 70 : 68,
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text(
            "BẮT ĐẦU",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
