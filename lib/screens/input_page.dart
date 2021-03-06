import 'results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActivatedCardColor
                        : kInActiveCardColor,
                    cardChild: GenderCard(
                      iconLogo: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActivatedCardColor
                        : kInActiveCardColor,
                    cardChild: GenderCard(
                      iconLogo: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActivatedCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kIconTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kIconNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kIconTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomButtonColor,
                      overlayColor: Color(0x29E83D66),
                      inactiveTrackColor: kInActiveCardColor,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 300.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActivatedCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kIconTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kIconNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kIconTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kIconNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                  colour: kActivatedCardColor,
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiNumber: calc.bmiCal(),
                            bmiOutput: calc.getOutput(),
                            bmiResult: calc.getResult(),
                          )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
