import 'package:flutter/material.dart';
class RoundedInput extends StatelessWidget {
  const RoundedInput({Key key, @required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return InputContainer();
  }
}



class InputContainer extends StatelessWidget {
  const InputContainer({Key key, @required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      // width: size.width*0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue
      ),
      child: TextField(
        cursorColor: Colors.blue,

      ),
    );
  }
}