import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_screen.dart';
import 'package:bmi_calculator/reusable_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final String bmiStatus;
  final String bmiRes;
  final String interPret;
  MyResult(this.bmiRes, this.bmiStatus, this.interPret);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "BMI RESULT",
          style: kTitleStyles,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReUseableContainer(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$bmiStatus".toUpperCase(),
                    style: kBmiStatusStyles,
                  ),
                  Text(
                    "$bmiRes",
                    style: kBmiResStyles,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Text(
                      "$interPret",
                      textAlign: TextAlign.center,
                      style: kBmiSugStyles,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                "RECALCULATE BMI",
                style: kTitleStyles,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  CupertinoPageRoute(builder: (context) => InputScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
