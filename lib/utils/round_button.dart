


import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  double height,weight;


  RoundButton({
    required this.text,required this.onTap,
    required this.height,required this.weight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15)
        ),
        height: height,
        width: weight,
        child: Center(
          child: Text(text,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
