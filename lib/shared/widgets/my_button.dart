import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_styles.dart';
import '../resources/color_manger/color_manger.dart';



class MyButton extends StatelessWidget {
  final String title;
  final onTap;
  final Color btnColor;
  final Color textColor;
  const MyButton({super.key,required this.title,required this.onTap,required this.btnColor,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadiusDirectional.circular(20),
            border: Border.all(
                color: ColorManger.kPrimary
            )
        ),
        child: Text(
          title,
          style: ralewayStyle.copyWith(
            fontWeight: FontWeight.w800,
            color: textColor,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
