//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

//=========SCREENS_IMPORT=============
import 'package:bmi_calculator_app/screens/home_screen.dart';

//=========STYLES_IMPORT=============
import 'package:bmi_calculator_app/styles/appbar_style.dart';
import 'package:bmi_calculator_app/styles/font_style.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              home: HomeScreenState(),
              title: "BMI Calculator",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: appBarStyle(),
                textTheme: TextTheme(
                  bodySmall: smallFontsStyle(),
                  bodyLarge: largeFontsStyle(),
                  bodyMedium: mediumFontsStyle(),
                )
              ),
            );
          }
        );
      }
    );
  }

}
