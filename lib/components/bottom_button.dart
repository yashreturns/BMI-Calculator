import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  BottomButton({@required this.buttonTitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kIconNumberStyle.copyWith(fontSize: 26.0),
          ),
        ),
        width: double.infinity,
        height: kBottomButtonHeight,
        color: kBottomButtonColor,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
