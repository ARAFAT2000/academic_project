import 'package:academic_project/Model/catagory.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';


class Catagory extends StatefulWidget {
  const Catagory({super.key});

  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SizedBox(
      height: size.height/6 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;

              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
              color: selectedIndex==index? Colors.blue[200]: Colors.transparent
              ),
              child: Column(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
