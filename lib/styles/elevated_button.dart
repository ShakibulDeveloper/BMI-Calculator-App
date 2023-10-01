//=========PACKAGES_IMPORT=============
import 'package:flutter/material.dart';

ButtonStyle circularElevatedButton(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  );
}