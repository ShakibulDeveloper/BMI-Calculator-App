//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//=========WIDGETS_IMPORT=============
import 'package:bmi_calculator_app/widgets/appbar.dart';

//=========STYLES_IMPORT=============
import 'package:bmi_calculator_app/styles/box_decoration.dart';


class DetailsScreen extends StatelessWidget{
  late double bmiScore;
  DetailsScreen({super.key, required this.bmiScore});

  //======HEALTH_STATUS_CHECK======
  checkHealthStat(context){
    if(bmiScore < 18.5){
      return Text("Underweight", style: Theme.of(context).textTheme.bodySmall);
    }else if(bmiScore >= 18.5 && bmiScore <= 24.9){
      return Text("Normal", style: Theme.of(context).textTheme.bodySmall);
    }else if(bmiScore >= 25 && bmiScore <= 29.9){
      return Text("Overweight", style: Theme.of(context).textTheme.bodySmall);
    }else{
      return Text("Obese", style: Theme.of(context).textTheme.bodySmall);
    }

  }

  //======DOCTOR_ADVICE======
  doctorAdvice(context){
    if(bmiScore < 18.5){
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "01.Nutritious Diet:\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
            TextSpan(text: "Focus on a balanced and nutrient-dense diet. Include a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats in your meals. Don't skip meals, and aim for regular, well-balanced snacks.\n\n", style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: "02.Caloric Intake:\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
            TextSpan(text: "Ensure you are consuming enough calories to maintain a healthy weight. This might mean slightly increasing your portion sizes and including healthy snacks between meals.\n\n", style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: "03.Protein-Rich Foods: :\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
            TextSpan(text: "Include protein-rich foods such as lean meats, fish, eggs, dairy, legumes, nuts, and seeds in your diet. Protein is essential for muscle repair and growth.\n\n", style: Theme.of(context).textTheme.bodySmall),
          ]
        ),
      );
    }else if(bmiScore > 24.9){
      return RichText(
        text: TextSpan(
            children: [
              TextSpan(text: "01.Comprehensive Evaluation:\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
              TextSpan(text: "It's important to understand the factors contributing to your weight gain. Let's begin with a thorough evaluation of your overall health, medical history, and lifestyle. This will help us identify any underlying issues and create a tailored plan for you.\n\n", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "02.Regular Physical Activity:\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
              TextSpan(text: "Engage in regular exercise that includes both aerobic activities (like walking, jogging, or swimming) and strength training. Aim for at least 150 minutes of moderate-intensity aerobic exercise per week, along with muscle-strengthening activities on two or more days a week.\n\n", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: "03.Nutrition and Portion Control:\n", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
              TextSpan(text: "Focus on a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats. Be mindful of portion sizes, and avoid processed foods, sugary beverages, and excessive calorie intake.\n\n", style: Theme.of(context).textTheme.bodySmall),
            ]
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Text("Result", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 140,
                  decoration: boxDecoration(),
                  child: Text(bmiScore.toStringAsFixed(1).toString(), style: Theme.of(context).textTheme.bodyLarge),
                ),
                Positioned(
                    top: 8,
                    left: 10,
                    child: Text("BMI Score:", style: Theme.of(context).textTheme.bodySmall),
                ),
                Positioned(
                  top: 8,
                  right: 10,
                  child: checkHealthStat(context),
                ),
              ],

            ),
            SizedBox(height: 15),
            doctorAdvice(context),
          ],
        ),
      ),
    );
  }

}