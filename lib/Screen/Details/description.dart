import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(

          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: size.height/20,
                width: size.width/3,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.center,
                child: ModifyText(text: 'Description', size: 15)
              ),
            ),
            SizedBox(
              width: size.width/18,
            ),
            Expanded(
              flex: 1,
              child: Container(
                  height: size.height/20,
                  width: size.width/3,
                  decoration: BoxDecoration(
                      color: kcontentColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: ModifyText(text: 'Specification', size: 15)
              ),
            ),
            SizedBox(
              width: size.width/18,
            ),
            Expanded(
              flex: 1,
              child: Container(
                  height: size.height/20,
                  width: size.width/3,
                  decoration: BoxDecoration(
                      color: kcontentColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: ModifyText(text: 'Reviews', size: 15)
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height/30,
        ),

        Text(description,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),)
      ],
    );
  }
}
