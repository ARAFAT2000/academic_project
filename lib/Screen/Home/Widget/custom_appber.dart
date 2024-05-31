import 'package:flutter/material.dart';

import '../../../Constant/constant.dart';


Row CustomAppber() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          style: IconButton.styleFrom(
              padding: EdgeInsets.all(20)
          ),
          onPressed: (){

          },
          icon: CircleAvatar(
            backgroundColor:kcontentColor ,
            child: Image.asset('images/icon.png',

              height: 20,
            ),
          )),
      IconButton(
          style: IconButton.styleFrom(

              padding: EdgeInsets.all(20)
          ),
          onPressed: (){

          },
          icon:CircleAvatar(
            backgroundColor: kcontentColor,
            child: Icon(
              Icons.notification_add_outlined,

            ),
          )),
    ],
  );
}