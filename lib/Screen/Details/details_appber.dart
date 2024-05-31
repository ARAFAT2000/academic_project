import 'package:academic_project/Constant/constant.dart';
import 'package:flutter/material.dart';


class DetailsAppber extends StatelessWidget {
  const DetailsAppber({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5,right: 5,top: 20),
    child: Row(
      children: [

        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: EdgeInsets.all(15)
          ),
          onPressed: (){
Navigator.pop(context);
        },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios)),

        ),
        Spacer(),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15)
          ),
          onPressed: (){

          },
          icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.share)),

        ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15)
          ),
          onPressed: (){

          },
          icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border)),

        ),
      ],
    ),
    );
  }
}
