//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//=========SCREENS_IMPORT=============
import 'package:bmi_calculator_app/screens/home_screen.dart';

AppBar appBarWidget(context, switchStat){
  return AppBar(
    title: Row(
      children: [
        Icon(Icons.health_and_safety_outlined, color: Colors.black, size: 20.sp,),
        SizedBox(width: 1.w),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text("BMI Calculator", style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    ),
    actions: [
      Switch(
        activeColor: Color(0xFFdafd87),
        value: switchStat,
        onChanged: (value){
          HomeScreenUI().switchButtonStat(value);
        },
      ),
    ],
  );
}