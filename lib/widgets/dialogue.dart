//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//=========SCREENS_IMPORT=============
import 'package:bmi_calculator_app/screens/details_screen.dart';

AlertDialog appAlertDialoge(context, bmiScore){
  return AlertDialog(
    title: Text("Your BMI Score:", style: Theme.of(context).textTheme.bodySmall),
    content: Text(bmiScore.toStringAsFixed(1).toString(), style: Theme.of(context).textTheme.bodyLarge),
    actions: [
      SizedBox(
        width: 100.w,
        height: 8.h,
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(bmiScore: bmiScore)));
          },
          child: Text("Check Details"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
      )
    ],
  );
}