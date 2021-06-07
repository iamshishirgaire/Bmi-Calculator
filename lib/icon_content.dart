import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconS, this.title});
  final iconS;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconS,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "$title",
          style: kTitleStyles,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  RoundIconButton(this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon),
      elevation: 26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
