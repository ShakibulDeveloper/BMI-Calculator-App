//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//=========WIDGETS_IMPORT=============
import 'package:bmi_calculator_app/widgets/dialogue.dart';
import 'package:bmi_calculator_app/widgets/appbar.dart';

//=========STYLES_IMPORT=============
import 'package:bmi_calculator_app/styles/elevated_button.dart';
import 'package:bmi_calculator_app/styles/box_decoration.dart';

class HomeScreenState extends StatefulWidget{
  const HomeScreenState({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenUI();

}

class HomeScreenUI extends State<HomeScreenState>{
  RangeValues _currentRangeValues = const RangeValues(0, 65);
  bool switchStat = false;

  String gender = "Male";
  int feet = 0;
  int inch = 0;
  double bmiScore = 0;

  //=====GENDER_STAT_UPDATE======
  void changeGenderStatus(String value){
    gender = value;
    setState(() {});
  }

  //=====INCREMENT_FEET_INCH======
  void incrementOnClick(String value){
    if(value == 'Feet'){
      feet++;
    }else{
      inch++;
    }
    setState(() {});
  }

  //=====INCREMENT_FEET_INCH======
  void decrementOnClick(String value){
    if(value == 'Feet'){
      if(feet > 0){
        feet--;
      }
    }else{
      if(inch > 0){
        inch--;
      }
    }
    setState(() {});
  }

  //=====SWITCH_STATUS======
  void switchButtonStat(bool value){
    if(value.toString() == 'false'){
      switchStat = false;
    }else{
      switchStat = true;
    }
    setState(() {});
  }

  //=====BMI_SCORE_CALCULATE======
  void bmiScoreCalculate(){
    double userWeight = _currentRangeValues.end;
    double userHeight = (feet*0.3048) + (inch*0.0254);
    bmiScore = userWeight/(userHeight*userHeight);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, switchStat),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    changeGenderStatus("Male");
                  },
                  child: Container(
                    width: 46.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: Color(gender == 'Male' ? 0xFFdafd87 : 0xFFe7e7e7),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.man, size: 28.sp,),
                        SizedBox(height: 2.h,),
                        Text("MALE", style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 2.w,),
                InkWell(
                  onTap: (){
                    changeGenderStatus("Female");
                  },
                  child: Container(
                    width: 46.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Color(gender == "Female" ? 0xFFdafd87 : 0xFFe7e7e7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.woman, size: 28.sp,),
                        SizedBox(height: 2.h,),
                        Text("FEMALE", style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            Container(
              width: 100.w,
              height: 28.h,
              decoration: boxDecoration(),
              child: Column(
                children: [
                  SizedBox(height: 3.h),
                  Text("WEIGHT (KG)", style: Theme.of(context).textTheme.bodySmall),
                  Text(_currentRangeValues.end.round().toString(), style: Theme.of(context).textTheme.bodyLarge),
                  RangeSlider(
                    activeColor: Colors.black,
                    inactiveColor: Colors.black38,
                    values: _currentRangeValues,
                    max: 200,
                    onChanged: (RangeValues values) {
                      _currentRangeValues = values;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Container(
                  width: 46.w,
                  height: 22.h,
                  decoration: boxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("FEET", style: Theme.of(context).textTheme.bodySmall),
                      Text(feet.toString()),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: (){
                                incrementOnClick('Feet');
                              },
                              child: Icon(Icons.add),
                              style: circularElevatedButton(),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: (){
                                decrementOnClick('Feet');
                              },
                              child: Icon(Icons.remove),
                              style: circularElevatedButton(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  width: 46.w,
                  height: 22.h,
                  decoration: boxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("INCH", style: Theme.of(context).textTheme.bodySmall),
                      Text(inch.toString()),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: (){
                                incrementOnClick('Inch');
                              },
                              child: Icon(Icons.add),
                              style: circularElevatedButton(),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: (){
                                decrementOnClick("Inch");
                              },
                              child: Icon(Icons.remove),
                              style: circularElevatedButton(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            SizedBox(
              width: 100.w,
              height: 10.h,
              child: ElevatedButton(
                onPressed: (){
                  bmiScoreCalculate();
                  showDialog(context: context, builder: (context){
                    return appAlertDialoge(context, bmiScore);
                  });
                },
                child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),),
            ),
          ],
        ),
      ),
    );
  }

}