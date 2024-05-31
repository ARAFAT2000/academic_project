import 'package:academic_project/Model/catagory.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';


class Catagory extends StatelessWidget {
  const Catagory({super.key});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SizedBox(
      height: size.height/6 ,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          separatorBuilder: (context,index)=> SizedBox(width:20 ,),
        itemBuilder: (context,index){
          return Column(
            children: [
              Container(
                height:size.height/13 ,
                width: size.width/6 ,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(categoriesList[index].image.toString()),fit: BoxFit.cover)
                ),
              ),
              SizedBox(
                height: size.height/45,
              ),

              ModifyText(text:categoriesList[index].title.toString(), size: 15)
            ],
          );
        },
      ),
    );
  }
}
