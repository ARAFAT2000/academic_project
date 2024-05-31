import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Screen/Home/Widget/catagory.dart';
import 'package:academic_project/Screen/Home/Widget/product_card.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';

import '../../Model/product_model.dart';
import 'Widget/custom_appber.dart';
import 'Widget/images_slider.dart';
import 'Widget/search_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int currentSlider = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 7,right: 7,top: 12),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //distance safearea to custom appber
              SizedBox(
                height: size.height/45,
              ),
              // create custom appber
              CustomAppber(),
              SizedBox(
                height: size.height/45,
              ),
              // create searchbar

              Searchbar(),

              SizedBox(
                height: size.height/45,
              ),
           // animated image slider
              ImageSlider(
                  currentSlide: currentSlider,
                  onChange: (value){
                    setState(() {
                      currentSlider=value;
                    });
              }),
              SizedBox(
                height: size.height/45,
              ),
              Catagory(),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModifyText(text: 'Special for you', size: 20),
                  ModifyText(text: 'See all', size: 14),
                ],
              ),
              
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 0.78,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  itemBuilder: (context,index){
                  return ProductCard(products: products[index]);
                  }
              )

            ],

          ),
        ),
      )
    );
  }




}
