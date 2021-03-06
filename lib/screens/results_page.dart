import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiOutput, bmiNumber, bmiResult;

  ResultsPage(
      {@required this.bmiNumber,
      @required this.bmiOutput,
      @required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Text(
                'Your Result',
                style: kIconTextStyle.copyWith(
                    fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 7,
              child: ReusableCard(
                colour: kActivatedCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiOutput,
                      style: kBmiOutputStyle,
                    ),
                    Text(
                      bmiNumber,
                      style: kBmiNumberStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiResultStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CALCULATE',
              ),
            ),
          ],
        ));
  }
}
