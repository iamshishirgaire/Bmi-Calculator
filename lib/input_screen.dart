import 'package:bmi_calculator/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_Container.dart';
import 'bmi_calc.dart';
import 'result.dart';

enum Gender {
  male,
  female,
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? gender = Gender.male;
  int height = 170;
  int weight = 50;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReUseableContainer(
                  onPress: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  colour: gender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    iconS: Icons.male,
                    title: "MALE",
                  ),
                )),
                Expanded(
                  child: ReUseableContainer(
                    onPress: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconS: Icons.female,
                      title: "FEMALE",
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReUseableContainer(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kTitleStyles,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyles,
                      ),
                      Text(
                        " cm",
                        style: kTitleStyles,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: kActiveCardColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                ],
              ),
              colour: kInactiveCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReUseableContainer(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kTitleStyles,
                      ),
                      Text(
                        "$weight",
                        style: kNumberStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(Icons.remove, () {
                            setState(() {
                              weight = weight - 1;
                            });
                          }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(Icons.add, () {
                            setState(() {
                              weight = weight + 1;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReUseableContainer(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kTitleStyles,
                      ),
                      Text(
                        "$age",
                        style: kNumberStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(Icons.remove, () {
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(Icons.add, () {
                            setState(() {
                              age++;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            Container(
              height: kBottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kBottomContainerColour,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                child: Text(
                  "CALCULATE BMI",
                  style: kTitleStyles,
                ),
                onPressed: () {
                  BmiCalculator bmiResults = BmiCalculator(height, weight);

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => MyResult(
                              bmiResults.resBmi(),
                              bmiResults.statusBmi(),
                              bmiResults.getInterpret(),
                            )),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
