import 'package:flutter/material.dart';
import '../constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({this.iconLogo, this.iconText});

  final IconData iconLogo;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconLogo,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          iconText,
          style: kIconTextStyle,
        ),
      ],
    );
  }
}
