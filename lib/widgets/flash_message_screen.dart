import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class FlashMessageScreen extends StatelessWidget {
  FlashMessageScreen(this._errorTitle, this._errorText) ;
final String _errorTitle,_errorText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
                color: Color(0xFFC72C33),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _errorTitle,
                          style: TextStyle( fontSize: 18,color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          _errorText,
                          style: TextStyle( fontSize: 14,color: Colors.white),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20)
              ),
              child: SvgPicture.asset(
                "assets/images/bubbles.svg",
                height: 48,
                width: 48,
                color: Color(0xFF801336),
              ),
            )
        ),
        Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/fail.svg",
                  height: 40,
                  // color: Color(0xFF801336),
                ),
                Positioned(
                  top: 10,
                  child:  SvgPicture.asset(
                    "assets/images/close.svg",
                    height: 16,
                    // color: Color(0xFF801336),
                  ),)
              ],
            )
        )
      ],
    );

  }
}
