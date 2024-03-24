import 'package:flutter/material.dart';

InputDecoration TextFieldInputDecoration(String label){
  return InputDecoration(

      hintText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      )
  );
}